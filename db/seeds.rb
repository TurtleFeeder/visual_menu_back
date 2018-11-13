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
restaurant_id_array = [1,2,3,4,5]
rating_array = [1,2,3,4,5]
price_array = [5.00, 10.00, 15.00, 20.00]
meal_id_array = (1..50).to_a

Restaurant.destroy_all
5.times do
  Restaurant.create(name: Faker::Name.unique.first_name + r_name_enders.sample, hours: hrs_array.sample, location: Faker::Address.unique.full_address, phone: Faker::PhoneNumber.area_code + Faker::PhoneNumber.exchange_code + Faker::PhoneNumber.unique.subscriber_number(4))
end



p "Created #{Restaurant.count} restaurant"



50.times do
  Meal.create(name: Faker::Food.dish,
                        description: Faker::Food.description,
                        imgurl: Faker::LoremFlickr.image("300x300", ['meal']),
                      restaurant_id: restaurant_id_array.sample,
                    price: price_array.sample)
end

p "Created #{Meal.count} meals"

200.times do
  Review.create(rating: rating_array.sample,
                      meal_id: meal_id_array.sample,
                      content: Faker::Movie.quote,
                    username: Faker::Name.name)
end

p "Created #{Review.count} reviews"
