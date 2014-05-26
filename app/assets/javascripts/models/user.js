window.Strava.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users',

  runs: function () {
    if (!this._runs) {
      this._runs = new Strava.Collections.Runs();
    }
    return this._runs;
  }
})