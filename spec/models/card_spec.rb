require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'カード名が必須であること' do
    card = Card.new
    card.valid?
    expect(card.errors[:title]).to include('can\'t be blank')
  end

end
