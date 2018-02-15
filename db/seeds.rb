# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


99.times do |n|
  firstnameb  = Faker::Name.first_name
  lastnameb= Faker::Name.last_name
  addressb = Faker::Address.street_address
  email = "example-#{n+1}@example.com"
  
  numberb = Faker::Number.number(8) #=> "1968353479"
  Contact.create!(FirstName:  firstnameb,
                LastName: lastnameb,
               Email: email,
               Phone: numberb,
               Address: addressb)
            
end