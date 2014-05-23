window.Run = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function () {
    new Run.Routers.AppRouter{};
    Backbone.history.start();
  }
};

$(Run.initialize);