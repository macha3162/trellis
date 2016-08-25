require 'rails_helper'

RSpec.describe "card_files/index", type: :view do
  before(:each) do
    assign(:card_files, [
      CardFile.create!(
        :card_id => 2,
        :title => "Title",
        :file => "File"
      ),
      CardFile.create!(
        :card_id => 2,
        :title => "Title",
        :file => "File"
      )
    ])
  end

  it "renders a list of card_files" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
