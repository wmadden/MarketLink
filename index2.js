var http = require('http');
var jsdom = require('jsdom');

// Some test options - looking at some guy here
var options = {
  host: "www.yelp.com.au",
  port: 80,
  // I'll work out how to put query strings in here later
  path: "/user_details?userid=0aTMmz6lfrpBJaAEKGa9Gw"
};

// We send a get request
http.get(options, function(res) {
  
  var resData = "";
  
  // Aggregate all the data
  res.on('data', function(chunk) {
    resData += chunk;
  });

  // When we're done getting data, do something
  res.on('end', function() {
    jsdom.env({
      html: resData,
      scripts: [
      'http://code.jquery.com/jquery-1.5.min.js'
      ]
    }, function (err, window) {
      var $= window.jQuery;
      var hrefs = new Array()
      $('.biz_info').each(function() {
        hrefs.push($(this).find('h4').find('a').attr('href')); 
      });
      // Bizzarely, the links from users to businesses are relative
      // Whereas the links from businesses to users are absolute
      console.log(hrefs);
    });
    
  });

}).on('error', function(e) {
  console.log("Got error: " + e.message);
});
