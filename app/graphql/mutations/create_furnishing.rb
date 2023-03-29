# frozen_string_literal: true

module Mutations
  class CreateFurnishing < BaseMutation
    argument :property_id, Integer, required: true
    argument :name, String, required: true
    argument :color, String, required: true
    argument :condition, String, required: true
    argument :quantity, Integer, required: true

    field :furnishing, Types::FurnishingType, null: false
    field :errors, [String], null: false

    def resolve(name:, color:, condition:, quantity:, property_id:)
      furnishing = Furnishing.new(name:,
                                  color:,
                                  condition:,
                                  quantity:,
                                  property_id:)

      if furnishing.save
        { furnishing:, errors: [] }
      else
        { furnishing: nil, errors: furnishing.errors.full_messages }
      end
    end
  end
end
