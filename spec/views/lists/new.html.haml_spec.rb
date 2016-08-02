require 'rails_helper'

RSpec.describe "lists/new", type: :view do
  before(:each) do
    assign(:list, List.new(
      :description => "MyText",
      :list => nil,
      :user => nil,
      :order => 1
    ))
  end

  it "renders new list form" do
    render

    assert_select "form[action=?][method=?]", lists_path, "post" do

      assert_select "textarea#list_description[name=?]", "list[description]"

      assert_select "input#list_list_id[name=?]", "list[list_id]"

      assert_select "input#list_user_id[name=?]", "list[user_id]"

      assert_select "input#list_order[name=?]", "list[order]"
    end
  end
end
