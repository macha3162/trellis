require 'rails_helper'

RSpec.describe "boards/new", type: :view do
  before(:each) do
    assign(:board, Board.new(
      :name => "MyString",
      :scope => "MyString",
      :bgcolor => "MyString"
    ))
  end

  it "renders new board form" do
    render

    assert_select "form[action=?][method=?]", boards_path, "post" do

      assert_select "input#board_name[name=?]", "board[name]"

      assert_select "input#board_scope[name=?]", "board[scope]"

      assert_select "input#board_bgcolor[name=?]", "board[bgcolor]"
    end
  end
end
