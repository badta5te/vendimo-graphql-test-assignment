class Furnishing < ApplicationRecord
  belongs_to :property

  validates :color, :condition, :quantity, presence: true
end
