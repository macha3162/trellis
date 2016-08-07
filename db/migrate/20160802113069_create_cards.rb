class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.references :list, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :ordinal, default: 0, null: false

      t.timestamps
    end
  end
end
