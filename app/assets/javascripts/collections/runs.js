window.Strava.Collections.Runs = Backbone.Collection.extend({
  url: function () {
    return "/api/runs";
  },

  model: Strava.Models.Run,

  comparator: function(model) {
    return model.get("start_date");
  }

});

window.Strava.Collections.runs = new Strava.Collections.Runs();