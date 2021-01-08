class User < ApplicationRecord
  has_many :items
  has_many :bookings
  has_many :reviews, as: :reviewiable
  has_many :own_reviews, class_name: 'Review'
end
