class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :type
      t.string :address
      t.float :size
      t.integer :bedrooms

      t.timestamps
    end
  end
end
