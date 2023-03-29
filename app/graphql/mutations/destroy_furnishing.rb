# frozen_string_literal: true

module Mutations
  class DestroyFurnishing < BaseMutation
    argument :id, ID, required: true

    field :id, ID, null: true

    def resolve(id:)
      furnishing = Furnishing.find(id)

      if furnishing.destroy
        { id:, errors: [] }
      else
        { id: nil, errors: furnishing.errors.full_messages }
      end
    end
  end
end
