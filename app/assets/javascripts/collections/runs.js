window.Strava.Collections.Runs = Backbone.Collection.extend({
  url: "/api/runs",
  model: Strava.Models.Run,
  comparator: function(model) {
    return model.get("start_date");
  }
});

window.Strava.runs = new Strava.Collections.Runs();