var http = require('http');
var jsdom = require('jsdom');

//TODO: Decide what this returns.
//TODO: Make this asynchronous and play nice.
function scrape(options, query) {
  
  // We send a get request
  http.get(options, function(res) {
  
    var resData = "";
  
    // Aggregate all the data
    res.on('data', function(chunk) {
      resData += chunk;
    });

    // When we're done getting data, perform the query. 
    res.on('end', function() {
      //Initialise the DOM for JQuery 
      jsdom.env({
        //TODO: I think we might be able to avoid the GET request. 
        html: resData,
        scripts: [
        //TODO: Do this locally instead. 
        'http://code.jquery.com/jquery-1.5.min.js'
        ]
      }, function(err, window){
        //Is this wrapping necessary?
        query(err, window);
      });
    });

  }).on('error', function(e) {
    console.log("Got error: " + e.message);
  });
}

exports.scrape = scrape;
