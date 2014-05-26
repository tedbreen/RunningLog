window.Strava.Collections.Users = Backbone.Collection.extend({
  model: Strava.Models.User,

  url: '/api/users',

  getOrFetch: function(id){
    var model;
    var users = this;
    if (model = this.get(id)) {
      return model;
    } else {
      model = new Strava.Models.User({ id: id });
      model.fetch({
        success: function () { users.add(model) }
      });
      return model;
    }
  }
})

window.Strava.Collections.users = new Strava.Collections.Users();