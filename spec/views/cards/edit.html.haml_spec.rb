require 'rails_helper'

RSpec.describe "cards/edit", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      :description => "MyText",
      :list => nil,
      :user => nil,
      :order => 1
    ))
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(@card), "post" do

      assert_select "textarea#card_description[name=?]", "card[description]"

      assert_select "input#card_list_id[name=?]", "card[list_id]"

      assert_select "input#card_user_id[name=?]", "card[user_id]"

      assert_select "input#card_order[name=?]", "card[order]"
    end
  end
end
