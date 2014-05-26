window.Strava.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],

  initialize: function(options){
    this.listenTo( this.model, "sync", this.render );
    this.listenTo( this.model.runs(), "sync", this.render );
  },

  render: function(){
    var renderedContent = this.template({
      user: this.model,

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