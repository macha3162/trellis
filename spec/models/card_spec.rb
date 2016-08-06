require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'validation' do
    it 'カード名が必須であること' do
      card = Card.new
      card.valid?
      expect(card.errors[:title]).to include('を入力してください')
    end
  end
end
