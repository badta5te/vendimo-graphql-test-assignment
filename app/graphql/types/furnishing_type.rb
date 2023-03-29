# frozen_string_literal: true

module Types
  class FurnishingType < Types::BaseObject
    field :id, ID, null: false
    field :color, String, null: false
    field :condition, String, null: false
    field :quantity, Integer, null: false
    field :notes, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :name, String, null: false
    field :property, Types::PropertyType, null: false
  end
end
