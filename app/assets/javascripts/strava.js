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