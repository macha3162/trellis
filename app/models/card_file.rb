class CardFile < ApplicationRecord
  belongs_to :card
  has_uploadcare_file :file

  def cdn_url
    ''
  end
end
