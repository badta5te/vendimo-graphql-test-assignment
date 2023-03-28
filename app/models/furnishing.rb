# frozen_string_literal: true

class Furnishing < ApplicationRecord
  belongs_to :property

  validates :name, :color, :condition, :quantity, presence: true
end
