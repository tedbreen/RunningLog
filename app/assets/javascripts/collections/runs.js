window.Strava.Collections.Runs = Backbone.Collection.extend({
  url: function () {
    return "/api/runs/page/" + this.page;
  },

  initialize: function(models, options) {
    this.page = 1;
  },

  parse: function(response) {
    this.total_pages = response.total_pages;
    return response.models;
  },

  model: Strava.Models.Run,

  getNextPage: function () {
    this.page += 1;
    console.log("page" + this.page)
    console.log("page button: " + Strava.Collections.runs.length)
    this.fetch({ remove: false });
  },

  comparator: function(a, b) {
    var aModel = a.get('time_date');
    var bModel = b.get('time_date');
    if (aModel < bModel) {
      return 1;
    } else {
      return -1;
    }
  },

  getOrFetch: function(id) {
    var model;
    var runs = this;
    model = this.get(id);
    if (model !== undefined) {
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
      if (Strava.Collections.users.length < 1) {
        Strava.Collections.users.fetch();
      }
      this._users = Strava.Collections.users;
    }
    return this._users;
  }

});

window.Strava.Collections.runs = new Strava.Collections.Runs();