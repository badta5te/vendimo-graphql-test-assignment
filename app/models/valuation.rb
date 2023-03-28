# frozen_string_literal: true

class Valuation < ApplicationRecord
  belongs_to :property

  validates :date, :value, :evaluator, :currency, presence: true
end
