window.Strava.Views.RunShow = Backbone.View.extend({
  template: JST['runs/show'],

  initialize: function () {
    this.listenTo( this.model, "sync", this.render );
  },

  render: function () {
    debugger;
    var renderedContent = this.template({
      run: this.model,

      justTime: function(time) {
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