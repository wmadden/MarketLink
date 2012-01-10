var scraper = require('./scraper');

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
    hrefs.push($(this).find('h4').find('a').attr('href')); 
  });
  // Bizzarely, the links from users to businesses are relative
  // Whereas the links from businesses to users are absolute
      console.log(hrefs);
}

scraper.scrape(options, query);
