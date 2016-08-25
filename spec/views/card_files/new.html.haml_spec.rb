require 'rails_helper'

RSpec.describe "card_files/new", type: :view do
  before(:each) do
    assign(:card_file, CardFile.new(
      :card_id => 1,
      :title => "MyString",
      :file => "MyString"
    ))
  end

  it "renders new card_file form" do
    render

    assert_select "form[action=?][method=?]", card_files_path, "post" do

      assert_select "input#card_file_card_id[name=?]", "card_file[card_id]"

      assert_select "input#card_file_title[name=?]", "card_file[title]"

      assert_select "input#card_file_file[name=?]", "card_file[file]"
    end
  end
end
