# frozen_string_literal: true

module Mutations
  class DestroyValuation < BaseMutation
    argument :id, ID, required: true

    field :id, ID, null: true

    def resolve(id:)
      valuation = Valuation.find(id)

      if valuation.destroy
        { id:, errors: [] }
      else
        { id: nil, errors: valuation.errors.full_messages }
      end
    end
  end
end
