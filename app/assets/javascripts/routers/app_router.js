window.Strava.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    ""              : "runsIndex",
    "users/new"     : "userNew",
    "users/:id"     : "userShow",
    "runs/page/:id" : "runsIndex",
    "runs/new"      : "runNew",
    "runs/calendar" : "runCalendar",
    "runs/:id"      : "runShow",
  },

  runsIndex: function (id) {
    var indexView = new Strava.Views.RunsIndex({
      collection: Strava.Collections.runs
    });
    if (id !== null) {
      Strava.Collections.runs.page = id;
    }
    Strava.Collections.runs.fetch();

    this._swapView( indexView );
  },

  userNew: function () {
    var newView = new Strava.Views.UserNew();
    this._swapView( newView );
  },

  userShow: function(id) {
    var showModel = Strava.Collections.users.getOrFetch(id);
    showModel.runs().fetch();

    var showView = new Strava.Views.UserShow({
      model: showModel
    });

    this._swapView( showView );
  },

  runShow: function(id) {
    var runModel = Strava.Collections.runs.getOrFetch(id);

    var runView = new Strava.Views.RunShow({
      model: runModel
    });

    this._swapView( runView );

  },

  runNew: function () {
    var newView = new Strava.Views.RunNew();
    this._swapView( newView );
  },

  runCalendar: function () {
    var calendarView = new Strava.Views.RunCalendar();
    this._swapView( calendarView );
  },

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this._currentView.render();
    $('#content').html( this._currentView.$el ).hide().fadeIn();
  }
});