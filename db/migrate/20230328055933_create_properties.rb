class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :type, null: false
      t.string :address, null: false
      t.float :size, null: false
      t.integer :bedrooms, null: false

      t.timestamps
    end
  end
end
