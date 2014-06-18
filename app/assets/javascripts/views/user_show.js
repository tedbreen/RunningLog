window.Strava.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],
  
  initialize: function(options){
    this.listenTo( this.model, "sync", this.render );
  },

  render: function(){
    $('body').scrollTop(0);
    var renderedContent = this.template({
      user: this.model
    });
    this.$el.html( renderedContent );
    var user_id = this.model.get('id');
    var indexView = new Strava.Views.UserRunsIndex({
      collection: Strava.Collections.userRuns
    });
    
    if (Strava.Collections.userRuns.length < 2) {
      Strava.Collections.userRuns.fetch({
        data: { page: 1, user_id: user_id }
      });
    }
    
    this.$("#child-views").html(indexView.render().$el);    
    return this;
  }
    
})