window.Run.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "" : "runsIndex"
  },

  initialize: function(options) {
    this.$rootEl = options.rootEl;
  }

  runsIndex: function(){
    var indexView = new Run.Views.Run({
      collection = Run.Collections.runs;
    });
    Run.Collections.runs.fetch();
    this._swapView( indexView )
  }

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view
    this.$rootEl.html( this._currentView.$el )
  }
});