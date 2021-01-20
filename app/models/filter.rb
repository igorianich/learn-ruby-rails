# frozen_string_literal: true

class Filter < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :options
end
