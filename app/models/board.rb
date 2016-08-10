class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :users_boards, dependent: :destroy
  has_many :users, through: :users_boards
  has_many :cards
  validates :name, presence: true, length: {maximum: 255}

  before_save :set_bgcolor

  const :BGCOLOR do
    BLUE '#0079BF'
    ORANGE '#D29034'
    GREEN '#519839'
    RED '#B04632'
    PURPLE '#89609E'
    PINK '#CD5A91'
    LITE_GREEN '#4BBF6B'
    LITE_BLUE '#00AECC'
    GRAY '#838C91'
  end

  def set_bgcolor
    self.bgcolor ||= BGCOLOR.values.sample
  end
end
