class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :board, foreign_key: true
      t.integer :ordinal, default: 0, null: false

      t.timestamps
    end
  end
end
