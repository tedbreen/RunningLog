# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new(email: "katie.famous@gmail.com",
              fname: "Katie",
              lname: "Famous",
              gender: "2",
              city: "Tualatin",
              state: "OR"
)
u1.password = "katie"
u1.save

u2 = User.new(email: "ted.breen@gmail.com",
              fname: "Edward",
              lname: "Breen",
              gender: "1",
              city: "Stoneham",
              state: "MA"
)
u2.password = "ted"
u2.save

time1 = Time.new( 2000, 1, 1, 10, 30, 0, "-05:00" )
date1 = Date.new( 2014, 4, 21 )
r1 = Run.create(user_id: 2,
                start_time: time1,
                run_type: 3,
                city: "Hopkinton",
                state: "MA",
                start_date: date1,
                title: "Boston Marathon",
                description: "Boston Strong!",
                distance: 26.2,
                duration: 10305
)

time2 = Time.new(2000,1,1,8,0, 0, "-08:00")
date2 = Date.new(2014,5,23)
r2 = Run.create(user_id: 2,
                start_time: time2,
                run_type: 0,
                city: "San Francisco",
                state: "CA",
                start_date: date2,
                title: "App Academy commute",
                description: "Stopped at Whole Foods on the way",
                distance: 4.9
)

time3 = Time.new(2000,1,1,9,0, 0, "-08:00")
date3 = Date.new(2014,5,17)
r3 = Run.create(user_id: 1,
                start_time: time3,
                run_type: 0,
                city: "San Diego",
                state: "CA",
                start_date: date3,
                title: "Balboa Park",
                description: "A sunny day in the park",
                distance: 6.5
)

time4 = Time.new(2000,1,1,18,0, 0, "-08:00")
date4 = Date.new(2014,5,22)
r4 = Run.create(user_id: 1,
                start_time: time4,
                run_type: 0,
                city: "San Francisco",
                state: "CA",
                start_date: date4,
                title: "Lands End",
                description: "Beautiful views of the bridge!",
                distance: 8
)