window.Strava.Views.RunsIndex = Backbone.View.extend({
  template: JST['runs/index'],

  events: {
    "click .next-page-button" : "nextPage",
  },

  initialize: function(options) {
    this.listenTo( this.collection, "sync add", this.render );
    this.listenTo( this.collection.users(), "sync", this.render );
  },

  render: function() {
    var renderedContent = this.template({
      runs: this.collection,

      justTime: function(time) {
        if (time[11] === '0') {
          return time.slice(12, 16);
        }
        return time.slice(11, 16);
      }

    });
    this.$el.html( renderedContent );
    return this;
  },

  nextPage: function(event) {
    this.collection.getNextPage();
  }
})