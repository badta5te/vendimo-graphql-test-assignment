# frozen_string_literal: true

module Types
  class PropertyType < Types::BaseObject
    field :id, ID, null: false
    field :property_type, String, null: false
    field :address, String, null: false
    field :size, Float, null: false
    field :bedrooms, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :valuation, Types::ValuationType
    field :furnishing, Types::FurnishingType
  end
end
