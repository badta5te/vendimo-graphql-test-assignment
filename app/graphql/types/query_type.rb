module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :properties, [Types::PropertyType], null: false, description: "The list of properties"
    def all_properties
      Property.all
    end

    field :property, Types::PropertyType, null: false do
      argument :id, ID, required: true
    end
    def property(id:)
      Property.find(id)
    end

    field :furnishings, [Types::FurnishingType], null: false, description: "The list of furnishings"
    def all_furnishings
      Furnishing.all
    end

    field :valuations, [Types::ValuationType], null: false, description: "The list of valuations"
    def all_valuations
      Valuation.all
    end
  end
end
