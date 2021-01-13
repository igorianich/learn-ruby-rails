class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # validates :start_rent, :end_rent, presence: true
end
