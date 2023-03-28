class Property < ApplicationRecord
  has_one :furnishing, dependent: :destroy
  has_one :valuation, dependent: :destroy

  validates :type, :address, :size, :bedrooms, presence: true
end
