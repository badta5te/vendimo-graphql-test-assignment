class RemoveNotesColumnFromValuation < ActiveRecord::Migration[7.0]
  def change
    remove_column :valuations, :notes
  end
end
