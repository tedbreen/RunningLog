window.Strava.Views.RunShow = Backbone.View.extend({
  template: JST['runs/show'],

  initialize: function (options) {
    this.listenTo( this.model, "sync", this.render );
    this.listenTo( this.model.users(), "sync", this.render )
  },

  render: function () {
    $('body').scrollTop(0);
    var renderedContent = this.template({
      run: this.model,

      justTime: function(time) {
        if (time[11] === '0') {
          return time.slice(12, 16);
        }
        return time.slice(11, 16);
      },

    });
    this.$el.html( renderedContent );
    return this;
  },

})