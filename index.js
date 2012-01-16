var scraper = require('./scraper');
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
    var parsed = url.parse(href);
    parsed.protocol = "http";
    parsed.hostname = "www.yelp.com.au";
    parsed.hash = "";
    console.log(url.format(parsed)); 
  });
  // Bizzarely, the links from users to businesses are relative
  // Whereas the links from businesses to users are absolute
}

scraper.scrape(options, query);
