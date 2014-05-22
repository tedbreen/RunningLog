# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email:    'ted.breen@gmail.com',
                 password: 'ted',
                 gender:   '1',
                 city:     'Stoneham',
                 state:    'MA',
                 fname:    'Edward',
                 lname:    'Breen'
)

u2 = User.create(email:    'katie.famous@gmail.com',
                 password: 'katie',
                 gender:   '2',
                 city:     'Tualatin',
                 state:    'OR',
                 fname:    'Katie',
                 lname:    'Famous'
)