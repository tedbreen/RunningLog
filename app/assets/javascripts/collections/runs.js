window.Strava.Collections.Runs = Backbone.Collection.extend({
  url: function () {
    return "/api/runs";
  },

  model: Strava.Models.Run,

  comparator: function(a, b) {
    var aModel = a.get('start_date');
    var bModel = b.get('start_date');
    if (aModel < bModel) {
      return 1;
    } else {
      return -1;
    }
  },

  getOrFetch: function(id){
    var model;
    var runs = this;
    if (model = this.get(id)) {
      return model;
    } else {
      model = new Strava.Models.Run({ id: id });
      model.fetch({
        success: function () { runs.add(model) }
      });
      return model;
    }
  },

  users: function () {
    if (!this._users) {
      this._users = new Strava.Collections.Users();
    }
    return this._users;
  }

});

window.Strava.Collections.runs = new Strava.Collections.Runs();