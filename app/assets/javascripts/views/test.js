window.Strava.Views.Test = Backbone.View.extend({
  template: JST['runs/test'],
  
  render: function () {
    var renderedContent = this.template();
    this.$el.html( renderedContent );
    return this;
  }
})