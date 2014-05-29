window.Strava = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function () {
    var $rootEl = $('#content');
    new Strava.Routers.AppRouter();
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
}