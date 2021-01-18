# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :borrower, class_name: 'User'
  belongs_to :item
  validates :start_rent, :end_rent, presence: true
  validate :good_time

  def good_time
    if start_rent && end_rent
      errors.add(:start_rent,"Start rent can't be older than end rent") if start_rent > end_rent
     end
    end

end
