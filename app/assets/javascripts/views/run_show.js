window.Strava.Views.RunShow = Backbone.View.extend({
  template: JST['runs/show'],
  
  events: {
    'click button#destroy-run' : 'destroyRun'
  },
  
  destroyRun: function () {
    var delButton = confirm("Are you sure?");
    if (delButton) {
      this.model.destroy({
        success: function () {
          Backbone.history.navigate("", {
            trigger: true
          });
        }
      });
    }
  },

  initialize: function (options) {
    this.listenTo( this.model, "sync", this.render );
    this.listenTo( this.model.users(), "sync", this.render )
  },

  render: function () {
    $('body').scrollTop(0);
    var renderedContent = this.template({
      run: this.model
    });
    this.$el.html( renderedContent );
    return this;
  },

})