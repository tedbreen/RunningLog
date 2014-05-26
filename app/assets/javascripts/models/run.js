window.Strava.Models.Run = Backbone.Model.extend({
  urlRoot: "/api/runs",

  // using this function in the index template
  getUserId: function () {
    return this.get('user_id');
  },

  runType: function () {
    var type = this.get('run_type');
    switch (type) {
    case 0:
      return "Run";
    case 1:
      return "Long run";
    case 2:
      return "Workout";
    case 3:
      return "Race";
    default:
      return "Run";
    }
  },

  users: function () {
    if (!this._users) {
      this._users = new Strava.Collections.Users();
    }
    return this._users;
  }

});