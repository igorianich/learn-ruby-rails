# frozen_string_literal: true

class City < ApplicationRecord
  has_many :users
  has_many :items, through: :users

  validates :name, :country, presence: true, length: { in: 2..30 }
  validates :population, numericality: { only_integer: true }
end
