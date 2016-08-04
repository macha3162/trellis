require 'rails_helper'

RSpec.describe "users_boards/new", type: :view do
  before(:each) do
    assign(:users_board, UsersBoard.new(
      :user_id => "MyString",
      :board_id => "MyString",
      :favorite => "MyString"
    ))
  end

  it "renders new users_board form" do
    render

    assert_select "form[action=?][method=?]", users_boards_path, "post" do

      assert_select "input#users_board_user_id[name=?]", "users_board[user_id]"

      assert_select "input#users_board_board_id[name=?]", "users_board[board_id]"

      assert_select "input#users_board_favorite[name=?]", "users_board[favorite]"
    end
  end
end
