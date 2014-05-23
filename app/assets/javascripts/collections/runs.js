window.Run.Collections.Runs = Backbone.Collection.extend({
  url: "/api/runs",
  model: Run.Models.Run,
  comparator: function(model) {
    return model.get("start_date");
  }
});

window.Run.Collections.runs = new Run.Collections.Runs();