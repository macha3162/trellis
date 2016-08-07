class Card < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :title, presence: true

  # 指定されたリストに対し、カードをID順に付け替える
  def self.sort(list, ids)
    Card.transaction do
      cards = Card.find(ids)
      cards.each_with_index do |card, index|
        # update_attributesを使うと無駄なSQLが発行されるので複数行で対応
        card.list = list
        card.ordinal = index
        card.save
      end
    end
  end
end
