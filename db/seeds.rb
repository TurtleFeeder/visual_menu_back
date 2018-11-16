# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'rest-client'

hrs_array = ['9AM-6PM', '11AM-8PM', '1PM-10PM']
r_name_enders = ["'s Kitchen", "'s Restaurant", "'s Cafe"]
Faker::Config.locale = 'en-US'
restaurant_id_array = [1,2,3,4,5]
rating_array = [1,2,3,4,5]
price_array = [5.00, 10.00, 15.00, 20.00]
meal_id_array = (1..50).to_a
img_array = ['https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_960_720.jpg',
'https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_960_720.jpg',
'https://cdn.pixabay.com/photo/2017/07/24/17/51/osso-buco-2535546_960_720.jpg',
'https://cdn.pixabay.com/photo/2014/03/14/04/11/pizza-286993_960_720.jpg',
'https://cdn.pixabay.com/photo/2015/05/14/22/05/pancake-767567_960_720.jpg',
'https://cdn.pixabay.com/photo/2014/05/26/14/53/sushi-354628_960_720.jpg',
'https://cdn.pixabay.com/photo/2016/03/05/19/09/asian-1238271_960_720.jpg',
'https://cdn.pixabay.com/photo/2017/05/11/19/44/fruit-2305192_960_720.jpg',
'https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971552_960_720.jpg',
'https://cdn.pixabay.com/photo/2018/08/16/22/59/ice-3611698_960_720.jpg', 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_960_720.jpg',
'https://cdn.pixabay.com/photo/2016/11/18/17/20/colorful-1835921_960_720.jpg',
'https://cdn.pixabay.com/photo/2016/10/13/11/44/chocolates-1737503_960_720.jpg',
'https://cdn.pixabay.com/photo/2017/12/26/04/51/fish-and-chip-3039746_960_720.jpg',
'https://cdn.pixabay.com/photo/2016/07/31/17/51/chicken-1559548_960_720.jpg',
'https://cdn.pixabay.com/photo/2018/02/23/14/18/tjena-kitchen-3175644_960_720.jpg']

Restaurant.destroy_all
5.times do
  a = Faker::PhoneNumber.area_code
  b = Faker::PhoneNumber.exchange_code
  c = Faker::PhoneNumber.unique.subscriber_number(4)
  Restaurant.create(name: Faker::Name.unique.first_name + r_name_enders.sample, hours: hrs_array.sample, location: Faker::Address.unique.full_address, phone: "(#{a})#{b}-#{c}")
end

p "Created #{Restaurant.count} restaurant"

# the Faker::LoremFlickr.image("300x300", ['meal']) is generating only the base URL "http://loremflickr.com/300/300/meal" - this needs to be sent through a get request to get a new image each time
# response = RestClient.get(Faker::LoremFlickr.image("300x300", ['meal']))
# the response.body returns a very long string of unreadable characters - can't use this for the meal image seed data

50.times do
  Meal.create(name: Faker::Food.dish,
                        description: Faker::Food.description,
                        imgurl: img_array.sample,
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
