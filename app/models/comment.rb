class Comment < ApplicationRecord
  belongs_to :card, counter_cache: true
  belongs_to :user
  validates :body, presence: true
end
