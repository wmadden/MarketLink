var http = require('http');
var jsdom = require('jsdom');

// Some test options - looking at kinokuniya here
var options = {
  host: "www.yelp.com.au",
  port: 80,
  path: "/biz/kinokuniya-bookstores-sydney"
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
      var hrefs = new Array();
      $('.user-name').each(function() {
        hrefs.push($(this).find('a').attr('href'));
      });

      console.log(hrefs); 
    });
    
    // console.log(resData);
  });

}).on('error', function(e) {
  console.log("Got error: " + e.message);
});
