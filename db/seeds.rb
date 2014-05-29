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

date1 = DateTime.new( 2014, 5, 18, 12, 0, 0 )
Run.create(user_id: 2,

           run_type: 3,
           city: "San Francisco",
           state: "CA",
           start_date: date1,
           title: "Bay to Breakers centipede",
           description: "Bay to Breakers, centipede division.  West Valley team.
The first half was tough.  I haven't run sub 6 pace in a while.  Didn't feel great before Hayes St hill, but at least I wasn't lagging.  Really started hurting on the hill.  Matt Laye was definitely pulling me (he was also pulling Hans).  The downhill was quite sweet.  Recovered a lot.  By the time we got into the park, I was feeling fine.  It's basically all downhill from there to the finish.  A very runnable downhill, may I add.  My specialty. This was fun.  It would have been really fun if I was in better shape.  At least I wasn't the weakest link on the team.  It's hard to order the segments correctly.  Formations get a little wacky as a result.",
           distance: 7.45,
           duration: 2540
)
# Ted: run

date2 = DateTime.new(2014,5,23, 12, 0, 0)
Run.create(user_id: 2,

           run_type: 0,
           city: "San Francisco",
           state: "CA",
           start_date: date2,
           title: "Backpack run to home from App Academy",
           description: "Ran home from App Academy. Ran a little harder than usual.  Had to get home in time so I could drive Katie to the airport.",
           distance: 4.9
)
# Ted: long run

date3 = DateTime.new(2014, 3, 23, 12, 0, 0)
Run.create(user_id: 2,

           run_type: 1,
           city: "San Rafael",
           state: "CA",
           start_date: date3,
           title: "China Camp and downtown San Rafael",
           description: "China Camp, including Shoreline Trail and a loop through downtown San Rafael. Felt OK.  It was rather warm this morning.  Tired at the end, but was not bonking.  Could have squeezed out a couple more miles if I had to, but I didn't feel compelled.",
           distance: 22.5
)
# Ted: workout

date4 = DateTime.new(2013, 12, 10, 12, 0, 0)
Run.create(user_id: 2,

           run_type: 2,
           city: "Tualatin",
           state: "OR",
           start_date: date4,
           title: "2 x 1mi",
           description: "Tualatin HS outdoor track, 2 x mile with full recovery. Splits:  4:59 (5:42), 4:56.  Didn't feel great, but no problem hitting the 5k pace.  It felt extra cold on the track.",
           distance: 5
)

# Katie runs
date5 = DateTime.new(2014, 5, 19, 12, 0, 0)
Run.create(user_id: 1,
           run_type: 0,
           city: "San Diego",
           state: "CA",
           start_date: date5,
           title: "Balboa Park",
           description: "A sunny day in the park",
           distance: 8
)
# Katie: race
date6 = DateTime.new(2014, 4, 21, 12, 0, 0)
Run.create(user_id: 1,
           run_type: 3,
           city: "Boston",
           state: "MA",
           start_date: date6,
           title: "Boston Marathon",
           description: "so my race time was 3:37.  Finished the first half in 1:37...then the 2nd half in 2 hours.  Ouch.  Realized things weren't going well early...prob around 12 miles or so my quads started burning from the downhill.  Was able to finish, but it wasn't always pretty.  Also bought myself time in the medical tent at the finish.  Was dizzy again after I stopped running.  Felt better once I could lay down and put my feet above my head and drink gatorade.  It was a sunny day, prob around 65-70 by the finish.  Think I was a bit dehydrated by then finish.  I guess if I were to do Boston again, I'd do more training on long uphills/long descents at MP.  But for now, I think I'm going to focus on the 1/2 marathon.",
           distance: 26.2
)

# Katie: long run

date7 = DateTime.new(2014, 3, 23, 12, 0, 0)
Run.create(user_id: 1,

           run_type: 1,
           city: "San Rafael",
           state: "CA",
           start_date: date7,
           title: "China Camp Long Run",
           description: "with Christy for all of it, Julie for the 2nd half.  Felt pretty good, if we had more time, i could have gone for 3 hours pretty easily i think.  nice to get out of the city for the occasional long trail run.",
           distance: 18.3
)

# Katie: workout

date8 = DateTime.new(2014, 1, 15, 12, 0, 0)
Run.create(user_id: 1,

           run_type: 2,
           city: "San Francisco",
           state: "CA",
           start_date: date8,
           title: "2 x 2mi",
           description: "On the roads",
           distance: 8
)