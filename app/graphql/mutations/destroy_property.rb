# frozen_string_literal: true

module Mutations
  class DestroyProperty < BaseMutation
    argument :id, ID, required: true

    field :id, ID, null: true

    def resolve(id:)
      property = Property.find(id)

      if property.destroy
        { id: id, errors: [] }
      else
        { id: nil, errors: property.errors.full_messages}
      end
    end
  end
end
