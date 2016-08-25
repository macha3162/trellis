require 'rails_helper'

RSpec.describe "card_files/show", type: :view do
  before(:each) do
    @card_file = assign(:card_file, CardFile.create!(
      :card_id => 2,
      :title => "Title",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/File/)
  end
end
