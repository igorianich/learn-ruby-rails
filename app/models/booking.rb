# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :borrower, class_name: 'User'
  belongs_to :item

  validates :start_rent, :end_rent, presence: true
  validate :time_range

  def time_range
    return unless start_rent && end_rent && start_rent > end_rent

    errors.add(:start_rent, "Start rent can't be older than ending of rent")
  end
end
