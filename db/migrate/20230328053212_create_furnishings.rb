class CreateFurnishings < ActiveRecord::Migration[7.0]
  def change
    create_table :furnishings do |t|
      t.belongs_to :property, null: false, foreign_key: true
      t.string :color
      t.string :condition
      t.integer :quantity
      t.text :notes

      t.timestamps
    end
  end
end
