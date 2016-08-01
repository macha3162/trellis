require 'rails_helper'

RSpec.describe "boards/edit", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :name => "MyString",
      :scope => "MyString",
      :bgcolor => "MyString"
    ))
  end

  it "renders the edit board form" do
    render

    assert_select "form[action=?][method=?]", board_path(@board), "post" do

      assert_select "input#board_name[name=?]", "board[name]"

      assert_select "input#board_scope[name=?]", "board[scope]"

      assert_select "input#board_bgcolor[name=?]", "board[bgcolor]"
    end
  end
end
