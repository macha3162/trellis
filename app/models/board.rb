class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :users_boards, dependent: :destroy
  has_many :users, through: :users_boards
  has_many :cards
  attr_accessor :user

  validates :name, :user, presence: true, length: {maximum: 255}
  before_save :set_bgcolor
  after_create :build_users_boards

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

  def build_users_boards
    self.users_boards.create(user: user)
  end
end
