class RemoveNotesColumnFromFurnishing < ActiveRecord::Migration[7.0]
  def change
    remove_column :furnishings, :notes
  end
end
