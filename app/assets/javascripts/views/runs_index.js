window.Strava.Views.RunsIndex = Backbone.View.extend({
  template: JST['runs/index'],

  initialize: function() {
    this.listenTo(
      this.collection,
      "sync",
      this.render
    );
  },

  render: function() {
    var renderedContent = this.template({
      runs: this.collection,
      justTime: function(time){
        if (time[11] === '0') {
          return time.slice(12, 16);
        }
        return time.slice(11, 16);
      }
    });
    this.$el.html( renderedContent );
    return this;
  }
})