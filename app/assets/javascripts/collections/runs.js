window.Strava.Collections.Runs = Backbone.Collection.extend({
  url: function () {
    return "/api/runs";
  },

  model: Strava.Models.Run,

  comparator: function(model) {
    return model.get("start_date");
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
  }

});

window.Strava.Collections.runs = new Strava.Collections.Runs();