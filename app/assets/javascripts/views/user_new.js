window.Strava.Views.UserNew = Backbone.View.extend({
  template: JST['users/new'],

  events: {
    "submit form" : "submit"
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html( renderedContent );
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var newUser = new Strava.Models.User(params);
    newUser.save( {}, {
      success: function () {
        Strava.Collections.users.add( newUser );
        Backbone.history.navigate("", { trigger: true });
      }
    });
  }
})