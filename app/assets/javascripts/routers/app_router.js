window.Strava.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    ""          : "runsIndex",
    "users/:id" : "userShow"
  },

  runsIndex: function() {
    var indexView = new Strava.Views.RunsIndex({
      collection: Strava.Collections.runs,
    });
    Strava.Collections.runs.fetch();
    // Strava.Collections.runs.users().fetch();

    this._swapView( indexView );
  },

  userShow: function(id) {
    var showModel = Strava.Collections.users.getOrFetch(id);
    showModel.runs().fetch();

    var showView = new Strava.Views.UserShow({
      model: showModel
    });

    this._swapView( showView );
  },

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this._currentView.render();
    $('#content').html( this._currentView.$el );
  }
});