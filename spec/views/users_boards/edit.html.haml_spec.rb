require 'rails_helper'

RSpec.describe "users_boards/edit", type: :view do
  before(:each) do
    @users_board = assign(:users_board, UsersBoard.create!(
      :user_id => "MyString",
      :board_id => "MyString",
      :favorite => "MyString"
    ))
  end

  it "renders the edit users_board form" do
    render

    assert_select "form[action=?][method=?]", users_board_path(@users_board), "post" do

      assert_select "input#users_board_user_id[name=?]", "users_board[user_id]"

      assert_select "input#users_board_board_id[name=?]", "users_board[board_id]"

      assert_select "input#users_board_favorite[name=?]", "users_board[favorite]"
    end
  end
end
