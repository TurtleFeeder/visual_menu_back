# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

hrs_array = ['9AM-6PM', '11AM-8PM', '1PM-10PM']
r_name_enders = ["'s Kitchen", "'s Restaurant", "'s Cafe"]
Faker::Config.locale = 'en-US'

# create Restaurants
5.times do
  Restaurant.create(name: Faker::Name.unique.first_name + r_name_enders.sample, hours: hrs_array.sample, location: Faker::Address.unique.full_address, phone: Faker::PhoneNumber.area_code + Faker::PhoneNumber.exchange_code + Faker::PhoneNumber.unique.subscriber_number(4))
end

# Faker::Food.dish #=> "Caesar Salad"
# Faker::Food.description
