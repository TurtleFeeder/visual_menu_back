class Restaurant < ApplicationRecord
  has_many :meals
  has_many :reviews, through: :meals
end
