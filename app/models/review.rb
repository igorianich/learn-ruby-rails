class Review < ApplicationRecord
  belongs_to :reviewiable, polymorphic: true
end
