var page = require('webpage').create();
// page.open('http://www.monarch.co.uk/', function() {
//   page.render('monarch.png');
//   phantom.exit();
// });

page.open('http://www.monarch.co.uk', function(status) {
  if (status !== 'success') {
    console.log('Unable to access network');
  } else {
    var from = page.evaluate(function() {
      // return document.getElementById('content_0_homepagerail_1_Holidays_OriginListInspire').textContent;
      return document.getElementById('content_0_homepagerail_1_Flights_OpenJawOriginList').options[3];
    });
    console.log(from);
  }
  phantom.exit();
});