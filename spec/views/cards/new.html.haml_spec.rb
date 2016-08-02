require 'rails_helper'

RSpec.describe "cards/new", type: :view do
  before(:each) do
    assign(:card, Card.new(
      :description => "MyText",
      :list => nil,
      :user => nil,
      :order => 1
    ))
  end

  it "renders new card form" do
    render

    assert_select "form[action=?][method=?]", cards_path, "post" do

      assert_select "textarea#card_description[name=?]", "card[description]"

      assert_select "input#card_list_id[name=?]", "card[list_id]"

      assert_select "input#card_user_id[name=?]", "card[user_id]"

      assert_select "input#card_order[name=?]", "card[order]"
    end
  end
end
