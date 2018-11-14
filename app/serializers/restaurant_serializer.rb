class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :hours, :location, :phone

  has_many :meals
  # has_many :reviews, through: :meals

end # end RestaurantSerializer class
