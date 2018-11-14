class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :imgurl, :restaurant_id

  belongs_to :restaurant
  has_many :reviews
end
