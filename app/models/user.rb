class User < ApplicationRecord
  has_many :items
  has_many :bookings
  has_many :reviews, as: :reviewable
  has_many :own_reviews, class_name: 'Review'
  has_many :item_reviews, through: :items, source: :reviews
  belongs_to :city

  validates :first_name, :last_name, presence: true, length: { in: 2..30 }
  validates :age, numericality: { only_integer: true, greater_than: 17, less_than: 111 }
  validates :adress, presence: true, length: { in: 5..50 }
end
