window.Strava.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],
  
  initialize: function(options){
    this.listenTo( this.model, "sync", this.render );
    this.listenTo( this.model.runs(), "sync", this.render );
  },

  render: function(){
    $('body').scrollTop(0);
    var renderedContent = this.template({
      user: this.model
    });
    this.$el.html( renderedContent );
    return this;
  }
})