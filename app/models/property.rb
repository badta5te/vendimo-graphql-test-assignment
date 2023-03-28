# frozen_string_literal: true

class Property < ApplicationRecord
  has_one :valuation, dependent: :destroy
  has_one :furnishing, dependent: :destroy
end
