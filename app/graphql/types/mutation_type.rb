module Types
  class MutationType < Types::BaseObject
    field :create_property, mutation: Mutations::CreateProperty
    field :destroy_property, mutation: Mutations::DestroyProperty
  end
end
