# frozen_string_literal: true

class Valuation < ApplicationRecord
  belongs_to :property

  validates :property, uniqueness: true
  validates :date, :value, :evaluator, :currency, presence: true
end
