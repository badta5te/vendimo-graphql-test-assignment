# frozen_string_literal: true

module Mutations
  class CreateValuation < BaseMutation
    argument :property_id, Integer, required: true
    argument :date, GraphQL::Types::ISO8601Date, required: true
    argument :value, Float, required: true
    argument :evaluator, String, required: true
    argument :currency, String, required: true

    field :valuation, Types::ValuationType, null: false
    field :errors, [String], null: false

    def resolve(date:, value:, evaluator:, currency:, property_id:)
      valuation = Valuation.new(date:,
                                value:,
                                evaluator:,
                                currency:,
                                property_id:)

      if valuation.save
        { valuation:, errors: [] }
      else
        { valuation: nil, errors: valuation.errors.full_messages }
      end
    end
  end
end
