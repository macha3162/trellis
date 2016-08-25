class CreateCardFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :card_files do |t|
      t.integer :card_id
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
