# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new(email: "katie@email.com",
              fname: "Katie",
              lname: "Famous",
              gender: "2",
              city: "Tualatin",
              state: "OR",
              avatar: "https://github.com/identicons/tedbreen.png"
)
u1.password = "katie"
u1.save

u2 = User.new(email: "ted@email.com",
              fname: "Edward",
              lname: "Breen",
              gender: "1",
              city: "Stoneham",
              state: "MA",
              avatar: "https://avatars3.githubusercontent.com/u/5546294"
)
u2.password = "ted"
u2.save

# Ted: race
time1 = Time.new( 2000, 1, 1, 8, 15, 0, "-08:00" )
date1 = Date.new( 2014, 5, 18 )
Run.create(user_id: 2,
           start_time: time1,
           run_type: 3,
           city: "San Francisco",
           state: "CA",
           start_date: date1,
           title: "Bay to Breakers centipede",
           description: "Bay to Breakers, centipede division.  West Valley team.\n
                         The first half was tough.  I haven't run sub 6 pace in a while.  Didn't feel great before Hayes St hill, but at least I wasn't lagging.  Really started hurting on the hill.  Matt Laye was definitely pulling me (he was also pulling Hans).  The downhill was quite sweet.  Recovered a lot.  By the time we got into the park, I was feeling fine.  It's basically all downhill from there to the finish.  A very runnable downhill, may I add.  My specialty.\n
                         This was fun.  It would have been really fun if I was in better shape.  At least I wasn't the weakest link on the team.  It's hard to order the segments correctly.  Formations get a little wacky as a result.",
           distance: 7.45,
           duration: 2540
)
# Ted: run
time2 = Time.new(2000, 1, 1, 18, 20, 0, "-08:00")
date2 = Date.new(2014,5,23)
Run.create(user_id: 2,
           start_time: time2,
           run_type: 0,
           city: "San Francisco",
           state: "CA",
           start_date: date2,
           title: "Backpack run to home from App Academy",
           description: "Ran home from App Academy.\n
                         Ran a little harder than usual.  Had to get home in time so I could drive Katie to the airport.",
           distance: 4.9
)
# Ted: long run
time3 = Time.new(2000, 1, 1, 9, 35, 0, "-08:00")
date3 = Date.new(2014, 3, 23)
Run.create(user_id: 2,
           start_time: time3,
           run_type: 1,
           city: "San Rafael",
           state: "CA",
           start_date: date3,
           title: "China Camp and downtown San Rafael",
           description: "China Camp, including Shoreline Trail and a loop through downtown San Rafael.\n
                         Felt OK.  It was rather warm this morning.  Tired at the end, but was not bonking.  Could have squeezed out a couple more miles if I had to, but I didn't feel compelled.",
           distance: 22.5
)
# Ted: workout
time4 = Time.new(2000, 1, 1, 16, 00, 0, "-08:00")
date4 = Date.new(2013, 12, 10)
Run.create(user_id: 2,
           start_time: time4,
           run_type: 2,
           city: "Tualatin",
           state: "OR",
           start_date: date4,
           title: "2 x 1mi",
           description: "Tualatin HS outdoor track, 2 x mile with full recovery.\n
                         Splits:\n
                         4:59 (5:42), 4:56\n
                         Didn't feel great, but no problem hitting the 5k pace.  It felt extra cold on the track.",
           distance: 22.5
)

# Katie runs
time5 = Time.new(2000, 1, 1, 11, 9, 0, "-08:00")
date5 = Date.new(2014, 5, 19)
Run.create(user_id: 1,
           start_time: time5,
           run_type: 0,
           city: "San Diego",
           state: "CA",
           start_date: date5,
           title: "Balboa Park",
           description: "A sunny day in the park",
           distance: 8
)
# Katie: race
time6 = Time.new(2000, 1, 1, 10, 30, 0, "-08:00")
date6 = Date.new(2014, 4, 21)
Run.create(user_id: 1,
           start_time: time6,
           run_type: 3,
           city: "Boston",
           state: "MA",
           start_date: date6,
           title: "Boston Marathon",
           description: "Boston Strong!",
           distance: 26.2
)

# Katie: long run
time7 = Time.new(2000, 1, 1, 9, 30, 0, "-08:00")
date7 = Date.new(2014, 3, 23)
Run.create(user_id: 1,
           start_time: time7,
           run_type: 1,
           city: "San Rafael",
           state: "CA",
           start_date: date7,
           title: "China Camp Long Run",
           description: "with Christy for all of it, Julie for the 2nd half.  Felt pretty good, if we had more time, i could have gone for 3 hours pretty easily i think.  nice to get out of the city for the occasional long trail run.",
           distance: 18.3
)

# Katie: workout
time8 = Time.new(2000, 1, 1, 19, 27, 0, "-08:00")
date8 = Date.new(2014, 1, 15)
Run.create(user_id: 1,
           start_time: time8,
           run_type: 2,
           city: "San Francisco",
           state: "CA",
           start_date: date8,
           title: "2 x 2mi",
           description: "On the roads",
           distance: 8
)