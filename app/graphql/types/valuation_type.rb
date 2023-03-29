# frozen_string_literal: true

module Types
  class ValuationType < Types::BaseObject
    field :id, ID, null: false
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :value, Float, null: false
    field :evaluator, String, null: false
    field :currency, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :property, Types::PropertyType, null: false
  end
end
