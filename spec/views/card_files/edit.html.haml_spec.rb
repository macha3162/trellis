require 'rails_helper'

RSpec.describe "card_files/edit", type: :view do
  before(:each) do
    @card_file = assign(:card_file, CardFile.create!(
      :card_id => 1,
      :title => "MyString",
      :file => "MyString"
    ))
  end

  it "renders the edit card_file form" do
    render

    assert_select "form[action=?][method=?]", card_file_path(@card_file), "post" do

      assert_select "input#card_file_card_id[name=?]", "card_file[card_id]"

      assert_select "input#card_file_title[name=?]", "card_file[title]"

      assert_select "input#card_file_file[name=?]", "card_file[file]"
    end
  end
end
