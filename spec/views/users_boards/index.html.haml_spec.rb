require 'rails_helper'

RSpec.describe "users_boards/index", type: :view do
  before(:each) do
    assign(:users_boards, [
      UsersBoard.create!(
        :user_id => "User",
        :board_id => "Board",
        :favorite => "Favorite"
      ),
      UsersBoard.create!(
        :user_id => "User",
        :board_id => "Board",
        :favorite => "Favorite"
      )
    ])
  end

  it "renders a list of users_boards" do
    render
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Board".to_s, :count => 2
    assert_select "tr>td", :text => "Favorite".to_s, :count => 2
  end
end
