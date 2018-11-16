class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :hours, :location, :phone

  has_many :meals
  # has_many :reviews, through: :meals

  # the has_many through will create an array of reviews in the restaurant json - don't need this because we formatted the json data sent out to include a deeply nested reviews array through the restaurants controller

end # end RestaurantSerializer class
