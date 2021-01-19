class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, class_name: 'User'

  validates :text, presence: true, length: { in: 10..1000 }
  validate :rights_to_live_review

  private

  def rights_to_live_review
    case reviewable_type
    when 'Item'
      if Booking.where(borrower_id: reviewer_id, item_id: reviewable_id).empty?
        errors.add(:reviewer, "don't have bookings")
      end
    when 'User'
      if Booking.joins(:item).where(borrower_id: reviewer_id,
                                    items: { owner_id: reviewable_id }).empty?
        errors.add(:reviewer, "don't work with user")
      end
    end
  end
end
