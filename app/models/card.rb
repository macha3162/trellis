class Card < ApplicationRecord
  belongs_to :list
  belongs_to :user
  belongs_to :board
  has_many :comments, dependent: :destroy
  has_many :card_files, dependent: :destroy

  before_validation :set_board_id
  before_create :set_ordinal

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

  def set_board_id
    self.board_id = self.list.board_id if self.list.present?
  end

  def set_ordinal
    self.ordinal = self.list.cards.count
  end
end
