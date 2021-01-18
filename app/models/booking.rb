class Booking < ApplicationRecord
  belongs_to :borrower, class_name: 'User'
  belongs_to :item
  # validates :start_rent, :end_rent, presence: true
end
