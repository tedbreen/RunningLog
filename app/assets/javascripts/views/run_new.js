window.Strava.Views.RunNew = Backbone.View.extend({
  template: JST['runs/new'],

  events: {
    "submit form" : "submit"
  },

  render: function () {
    $('body').scrollTop(0);
    var renderedContent = this.template();
    this.$el.html( renderedContent );
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    params.run.time_date = newDate( params.date, params.time );
    delete params.date; delete params.time
    var newRun = new Strava.Models.Run(params);
    newRun.save({}, {
      success: function () {
        Strava.Collections.runs.add( newRun );
        Backbone.history.navigate("runs/" + newRun.get('id'), {
          trigger: true
        });
      },
    
      error: function() {
        Backbone.history.navigate("runs/new", { trigger: true });
      }
    
    });
  }
})