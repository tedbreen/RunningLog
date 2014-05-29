window.Strava.Views.RunNew = Backbone.View.extend({
  template: JST['runs/new'],

  events: {
    "submit form" : "submit"
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html( renderedContent );
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var newRun = new Strava.Models.Run(params);
    newRun.save({}, {
      success: function () {
        Strava.Collections.runs.add( newRun );
        Backbone.history.navigate("", { trigger: true });
      },

      error: function() {
        Backbone.history.navigate("runs/new", { trigger: true });
      }

    });
  }
})