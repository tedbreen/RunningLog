window.Strava.Models.Run = Backbone.Model.extend({
  urlRoot: "/api/runs",

  // using this function in the index template
  getUserId: function () {
    return this.get('user_id');
  },

  users: function () {
    if (!this._users) {
      this._users = new Strava.Collections.Users();
    }
    return this._users;
  }

});