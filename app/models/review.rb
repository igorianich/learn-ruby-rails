class Review < ApplicationRecord
  belongs_to :reviewiable, polymorphic: true
  belongs_to :user
end
