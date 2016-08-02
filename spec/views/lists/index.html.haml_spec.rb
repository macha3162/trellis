require 'rails_helper'

RSpec.describe "lists/index", type: :view do
  before(:each) do
    assign(:lists, [
      List.create!(
        :description => "MyText",
        :list => nil,
        :user => nil,
        :order => 2
      ),
      List.create!(
        :description => "MyText",
        :list => nil,
        :user => nil,
        :order => 2
      )
    ])
  end

  it "renders a list of lists" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
