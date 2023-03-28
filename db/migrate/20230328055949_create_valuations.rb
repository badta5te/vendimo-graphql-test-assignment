class CreateValuations < ActiveRecord::Migration[7.0]
  def change
    create_table :valuations do |t|
      t.belongs_to :property, null: false, foreign_key: true
      t.date :date, null: false
      t.float :value, null: false
      t.string :evaluator, null: false
      t.string :currency, null: false
      t.text :notes

      t.timestamps
    end
  end
end
