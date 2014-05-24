window.Strava.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "" : "runsIndex"
  },

  initialize: function(options) {
    // debugger;
    this.$rootEl = options.rootEl;
  },

  runsIndex: function(){
    var indexView = new Strava.Views.RunsIndex({
      collection: Strava.runs
    });
    Strava.runs.fetch();
    this._swapView( indexView );
  },

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html( this._currentView.$el );
  }
});