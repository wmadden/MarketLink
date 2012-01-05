var http = require('http');
var url = require('url');

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
    console.log(resData);
  });

}).on('error', function(e) {
  console.log("Got error: " + e.message);
});
