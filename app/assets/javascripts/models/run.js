window.Strava.Models.Run = Backbone.Model.extend({
  urlRoot: "/api/runs",

  // using this function in the index template
  getUserId: function () {
    return this.get('user_id');
  },

  runType: function () {
    var type = this.get('run_type');
    switch (type) {
    case 0:
      return "Run";
    case 1:
      return "Long run";
    case 2:
      return "Workout";
    case 3:
      return "Race";
    default:
      return "Run";
    }
  },

  users: function () {
    if (!this._users) {
      this._users = new Strava.Collections.Users();
    }
    return this._users;
  },

  displayDate: function () {
    var date = this.get( 'start_date' );
    var javaDate = new Date(date);

    var months = ["January", "February", "March", "April",
                  "May", "June", "July", "August",
                  "September", "October", "November", "December"];

    var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "Saturday"]

    return (days[javaDate.getDay()] + ", " +
            months[javaDate.getMonth()] + " " +
            javaDate.getDate() + ", " +
            javaDate.getFullYear() );
  },

  loc: function () {
    var city = this.get('city');
    var state = this.get('state');
    var newCity = "";
    var newState = "";
    for (var i = 0; i < city.length; i++) {
      if (city[i] === " ") {
        newCity += '+';
      } else {
        newCity += city[i];
      }
    }
    for (var j = 0; i < state.length; i++) {
      if (state[i] === " ") {
        newState += '+';
      } else {
        newState += state[i];
      }
    }
    return newCity + "," + newState;
  }

});