class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :username, :content, :rating, :meal_id

  belongs_to :meal
end
