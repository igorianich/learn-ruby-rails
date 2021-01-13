class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, as: :reviewiable
  validates :name, presence: true, length: { in: 3..20 }
  validates :price, numericality: { greater_than: 0 }

    scope :by_city, ->(city_name){ joins(user: :city).where(cities: {name: city_name})}


    scope :by_owner, ->(owner_id){ where(user_id: owner_id)}
end
  
