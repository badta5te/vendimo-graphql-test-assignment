module Types
  class MutationType < Types::BaseObject
    field :create_property, mutation: Mutations::CreateProperty
    field :destroy_property, mutation: Mutations::DestroyProperty
    field :create_valuation, mutation: Mutations::CreateValuation
    field :create_furnishing, mutation: Mutations::CreateFurnishing
  end
end
