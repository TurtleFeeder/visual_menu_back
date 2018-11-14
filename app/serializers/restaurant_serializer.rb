class RestaurantSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :hours, :location, :phone

  has_many :meals
  # has_many :reviews, through: :meals



end # end RestaurantSerializer class
