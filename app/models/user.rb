class User < ApplicationRecord
  has_many :users_boards, dependent: :destroy
  has_many :boards, through: :users_boards, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]


  def self.find_for_google_oauth2(google_response)
    return nil unless google_response_valid?(google_response)
    user = User.where(email: google_response.info.email).first

    unless user
      user = User.create(name: google_response.info.name,
                         provider: google_response.provider,
                         uid: google_response.uid,
                         email: google_response.info.email,
                         token: google_response.credentials.token,
                         password: Devise.friendly_token[0, 20])
    end
    user
  end

  def self.google_response_valid?(google_response)
    google_response.try(:info).present?
  end

  def cards
    ids = self.users_boards.pluck(:board_id)
    Card.where('board_id in (?)', ids).includes(:board)
  end
end
