window.Strava.Collections.Runs = Backbone.Collection.extend({
  url: "/api/runs",

  model: Strava.Models.Run,

  comparator: function(model) {
    return model.get("start_date");
  },

  users: function(){
    if (!this._users) {
      this._users = new Strava.Collections.Users();
    }
    return this._users;
  }
});

window.Strava.runs = new Strava.Collections.Runs();