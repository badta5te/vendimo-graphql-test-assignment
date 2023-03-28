# frozen_string_literal: true

module Mutations
  class CreateProperty < BaseMutation
    argument :property_type, String, required: true
    argument :address, String, required: true
    argument :size, Float, required: true
    argument :bedrooms, Integer, required: true

    field :property, Types::PropertyType, null: false
    field :errors, [String], null: false

    def resolve(property_type:, address:, size:, bedrooms:)
      property = Property.new(property_type: property_type, address: address, size: size, bedrooms: bedrooms)

      if property.save
        { property: property, errors: [] }
      else
        { property: nil, errors: property.errors.full_messages }
      end
    end
  end
end
