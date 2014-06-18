window.Strava.Collections.UserRuns = Backbone.Collection.extend({
  url: function () {
    return '/api/user_runs/page/' + this.page;
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
  
  getOrFetch: function (id) {
    var model;
    var runs = this;
    model = this.get(id);
    if (model !== undefined) {
      return model;
    } else {
      model = new Strava.Models.Run({ id: id })
      model.fetch({
        success: function () { runs.add(model); }
      });
      return model;
    }
  }
});

window.Strava.Collections.userRuns = new Strava.Collections.UserRuns();