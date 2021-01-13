class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, class_name: 'User'
  validates :text, presence: true, length: { in: 10..1000 }
  validate :was_booking

  private

  def was_booking
    if reviewable_type == 'Item'
      if  Booking.select(:borrower_id, :item_id).where(borrower_id: reviewer_id ,item_id: reviewable_id).blank?
        p "didn't have item"
        errors.add(:reviewer_id, "you don't have bookings")
      end
    elsif reviewable_type == 'User'
      if  Booking.joins(:item).where(borrower_id: reviewer_id, items: { owner_id: reviewable_id }).blank?
        p "didn't have user"
        errors.add(:reviewer_id, "you don't have bookings")
      end
    else
      p ' type error'
      errors.add(:reviewable_type, "type exist")
    end
  end

end
