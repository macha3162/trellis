require 'rails_helper'

RSpec.describe Board, type: :model do


  it 'ボード名が必須であること' do
    board = Board.new
    board.valid?
    expect(board.errors[:name]).to include('を入力してください')
  end

  it 'モデル保存後にカラーがセットされていること' do
    board = Board.create(name: 'test')
    expect(Board::BGCOLOR.values).to include(board.bgcolor)
  end
end
