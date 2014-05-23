window.Run.Views.RunsIndex = Backbone.View.extend({
  template: JST['runs/index'],

  initialize: function(options) {
    this.listenTo(
      this.collection,
      "sync",
      this.render
    );
  },

  render: function() {
    var renderedContent = this.template({
      runs: this.collection
    })
    this.$el.html(renderedContent);
    return this;
  }
})