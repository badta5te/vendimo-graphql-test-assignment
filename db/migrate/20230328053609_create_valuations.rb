class CreateValuations < ActiveRecord::Migration[7.0]
  def change
    create_table :valuations do |t|
      t.date :date
      t.float :value
      t.string :evaluator
      t.string :currency
      t.text :notes

      t.timestamps
    end
  end
end
