require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'validation' do
    it 'カード名が必須であること' do
      card = Card.new
      card.valid?
      expect(card.errors[:title]).to include('を入力してください')
    end
  end

  describe 'sort' do
    it 'カードの並び替えが行えること' do
      user = create(:user)
      list = create(:list)
      list2 = create(:list2)

      card1 = create(:card1, list: list, user: user)
      card2 = create(:card2, list: list, user: user)
      card3 = create(:card3, list: list2, user: user)

      Card.sort(list, [card3.id, card1.id, card2.id])
      expect(list.cards.order(:ordinal)).to eq [card3, card1, card2]
    end
  end
end
