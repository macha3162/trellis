require 'rails_helper'

RSpec.describe "users_boards/show", type: :view do
  before(:each) do
    @users_board = assign(:users_board, UsersBoard.create!(
      :user_id => "User",
      :board_id => "Board",
      :favorite => "Favorite"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Board/)
    expect(rendered).to match(/Favorite/)
  end
end
