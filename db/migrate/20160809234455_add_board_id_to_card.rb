class AddBoardIdToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :board_id, :integer
    add_index :cards, :board_id
  end

  def up
    Card.all.each do |card|
      card.board_id = card.list.board_id
      card.save
    end
  end
end
