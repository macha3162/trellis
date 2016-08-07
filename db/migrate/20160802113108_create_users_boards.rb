class CreateUsersBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :users_boards do |t|
      t.integer :user_id
      t.integer :board_id
      t.boolean :favorite, default: false, null: false

      t.timestamps
    end
    add_index :users_boards, [:user_id, :board_id]
  end
end
