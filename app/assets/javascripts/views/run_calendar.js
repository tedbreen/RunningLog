window.Strava.Views.RunCalendar = Backbone.View.extend({
  template: JST['runs/calendar'],

  render: function () {
    var renderedContent = this.template({
      today: function () {
        return (new Date());
      }
    });
    this.$el.html( renderedContent );
    return this;
  }
})