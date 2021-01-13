class Review < ApplicationRecord
  belongs_to :reviewiable, polymorphic: true
  belongs_to :user
  validates :text, presence: true, length: { in: 10..1000 }
  validate :was_booking

  private

  def was_booking
    if reviewiable_type == 'Item'
      if  Booking.select(:user_id, :item_id).where(user_id: user_id,item_id: reviewiable_id).blank?
        p "didn't have item"
        errors.add(:user_id, "you don't have bookings")
      end
    elsif reviewiable_type == 'User'
      if  Booking.joins(:item).where(user_id: user_id, items: { user_id: reviewiable_id }).blank?
        p "didn't have user"
        errors.add(:user_id, "you don't have bookings")
      end
    else
      p ' type error'
      errors.add(:reviewiable_type, "type exist")
    end
  end

end
