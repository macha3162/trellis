class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :users_boards, dependent: :destroy
  has_many :users, through: :users_boards
  validates :name, presence: true, length: {maximum: 255}

  before_save :set_bgcolor

  const :BGCOLOR do
    PRIMARY '#337ab7'
    SUCCESS '#5cb85c'
    INFO '#5bc0de'
    WARNING '#f0ad4e'
    DANGER '#d9534f'
  end

  def set_bgcolor
    self.bgcolor ||= BGCOLOR.values.sample
  end
end
