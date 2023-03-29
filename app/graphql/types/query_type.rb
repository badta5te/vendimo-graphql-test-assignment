module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :properties, [Types::PropertyType], null: false, description: "The list of properties"
    def properties
      Property.all
    end

    field :property, Types::PropertyType, null: false do
      description "Get specific property by ID"
      argument :id, ID, required: true
    end
    def property(id:)
      Property.find(id)
    end

    field :furnishings, [Types::FurnishingType], null: false, description: "The list of furnishings"
    def furnishings
      Furnishing.all
    end

    field :furnishing, Types::FurnishingType, null: false do
      description "Get specific furnishing by ID"
      argument :id, ID, required: true
    end
    def furnishing(id:)
      Furnishing.find(id)
    end

    field :valuations, [Types::ValuationType], null: false, description: "The list of valuations"
    def valuations
      Valuation.all
    end

    field :valuation, Types::ValuationType, null: false do
      description "Get specific valuation by ID"
      argument :id, ID, required: true
    end
    def valuation(id:)
      Valuation.find(id)
    end
  end
end
