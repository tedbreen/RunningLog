window.Strava.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],
  
  events: {
    "submit form" : "submit"
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    params['start_date'] = newDate( params['start_date'], "0:01" );
    params['end_date'] = newDate( params['end_date'], "23:59" );
    params['user_id'] = this.model.get('id');
    $('form #start-date').val("");
    $('form #end-date').val("");
    console.log(params);
  },
  
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