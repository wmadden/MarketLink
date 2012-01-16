var Scraper = require('./scraper').Scraper;
var url = require('url');

// Some test options - looking at some guy here
var options = {
  host: "www.yelp.com.au",
  port: 80,
  // I'll work out how to put query strings in here later
  path: "/user_details?userid=0aTMmz6lfrpBJaAEKGa9Gw"
};

function query(err, window) {
  var $= window.jQuery;
  var hrefs = new Array()
  $('.biz_info').each(function() {
    var href = $(this).find('h4').find('a').attr('href'); 
    hrefs.push(href);
  });
  return hrefs;
}

function sanitize(raw) {
  var sanitized = new Array();
  for(i in raw) {
    var parsed = url.parse(raw[i]);
    parsed.protocol = "http";
    parsed.hostname = "www.yelp.com.au";
    parsed.hash = "";
    sanitized.push(url.format(parsed));
  }
  return sanitized;
}
var scraper = new Scraper();

scraper.on('done', function(links) {
  console.log(links);
});

scraper.scrape(options, query, sanitize);
