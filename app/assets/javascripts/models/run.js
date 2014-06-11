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
    var date = this.get( 'time_date' );
    var javaDate = new Date(date);
    var months = ["January", "February", "March", "April",
                  "May", "June", "July", "August",
                  "September", "October", "November", "December"];

    var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "Saturday"]
                
    return (days[javaDate.getDay()] + ", " +
            months[javaDate.getMonth()] + " " +
            javaDate.getDate() + ", " +
            javaDate.getFullYear());
  },
  
  displayTime: function () {
    var date = this.get( 'time_date' );
    var javaDate = new Date(date);
    var hours = javaDate.getHours();
    var mins = javaDate.getMinutes();
    if (mins < 10) { mins = "0" + mins }
    var fullTime = hours + ":" + mins;
    if ( hours < 12 ) {
      fullTime = fullTime + " AM";
    } else if ( hours === 12 ) {
      fullTime = fullTime + " PM";
    } else if (hours > 12) {
      hours = hours - 12;
      fullTime = hours + ":" + mins + " PM";
    }
    return ( fullTime );
  },

  loc: function () {
    var city = this.get( 'city' );
    if (city === undefined) {
      return "";
    } else {
      var state = this.get( 'state' );
      var newCity = "";
      for (var i = 0; i < city.length; i++) {
        if (city[i] === " ") {
          newCity += '+';
        } else {
          newCity += city[i];
        }
      }
      return newCity + "," + state;
    }
  }

});