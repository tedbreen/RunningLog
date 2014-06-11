window.Strava = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function () {
    new Strava.Routers.AppRouter({
      $rootEl: $('#content')
    });
    Backbone.history.start();
  }
};

$(function() {
  if($('#content').length !== 0) {  // empty <div id="content"> means logged out
    Strava.initialize();
  }
});

var weekMaker = function (date) {
  var week = [];

  var year = date.getFullYear(); var month = date.getMonth();
  var day = date.getDate(); var wday = date.getDay();

  var start = day - wday;
  for (var i = 0; i < 7; i++) {
    week.push( new Date(year, month, start + i) );
  }
  return week;
};

var newDate = function(dateStr, timeStr) {
  var date = dateStr.split('/');
  var month = parseInt( date[0] ) - 1;
  var day = parseInt( date[1] );
  var year = parseInt( date[2] );
  
  var time = timeStr.split(':');
  var hour = parseInt( time[0] );
  var min = parseInt( time[1] );
  
  var jDate = new Date(year, month, day, hour, min, 0);
  return jDate;
};