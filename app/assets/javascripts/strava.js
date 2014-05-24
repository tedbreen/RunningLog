window.Strava = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function () {
    alert('backbone started!')
    var $rootEl = $('#content');
    new Strava.Routers.AppRouter({
      rootEl: $rootEl
    });
    Backbone.history.start();
  }
};

$(function() {
  if($('#content').length !== 0) {
    Strava.initialize();
  }
});