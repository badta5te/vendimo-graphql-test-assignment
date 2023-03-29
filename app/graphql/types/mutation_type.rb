module Types
  class MutationType < Types::BaseObject
    field :create_property, mutation: Mutations::CreateProperty
    field :destroy_property, mutation: Mutations::DestroyProperty
    field :create_valuation, mutation: Mutations::CreateValuation
    field :destroy_valuation, mutation: Mutations::DestroyValuation
    field :create_furnishing, mutation: Mutations::CreateFurnishing
    field :destroy_furnishing, mutation: Mutations::DestroyFurnishing
  end
end
