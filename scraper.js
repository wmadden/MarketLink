var http = require('http');
var jsdom = require('jsdom');
var util = require('util');
var events = require('events');

function Scraper() {
  events.EventEmitter.call(this);
} 

util.inherits(Scraper, events.EventEmitter);

Scraper.prototype.scrape = function scrape(options, query, sanitize) {
 var self = this; 
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
        var hrefs = query(err, window);
        var sanitized = sanitize(hrefs);
        self.emit('done', sanitized);
      });
    
    });

  }).on('error', function(e) {
    console.log("Got error: " + e.message);
  });
}

exports.Scraper = Scraper;
