window.Strava.Views.UserRunsIndex = Backbone.View.extend({
  template: JST['user_runs/index'],
  
  events: {
    "click .next-page-button" : "nextPage",
  },
  
  initialize: function(options) {
    this.listenTo( this.collection, "sync add", this.render );
  },
  
  render: function () {
    var renderedContent = this.template({
      runs: this.collection
    });
    this.$el.html( renderedContent );
    return this;
  },
  
  nextPage: function (event) {
    this.collection.getNextPage();
  }
})