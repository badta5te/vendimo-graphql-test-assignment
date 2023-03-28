class AddNameColumnToFurnishings < ActiveRecord::Migration[7.0]
  def change
    add_column :furnishings, :name, :string, null: false
  end
end
