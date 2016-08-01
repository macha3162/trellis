require 'rails_helper'

RSpec.describe "boards/show", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :name => "Name",
      :scope => "Scope",
      :bgcolor => "Bgcolor"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Scope/)
    expect(rendered).to match(/Bgcolor/)
  end
end
