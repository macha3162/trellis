require 'rails_helper'

RSpec.describe "boards/index", type: :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        :name => "Name",
        :scope => "Scope",
        :bgcolor => "Bgcolor"
      ),
      Board.create!(
        :name => "Name",
        :scope => "Scope",
        :bgcolor => "Bgcolor"
      )
    ])
  end

  it "renders a list of boards" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Scope".to_s, :count => 2
    assert_select "tr>td", :text => "Bgcolor".to_s, :count => 2
  end
end
