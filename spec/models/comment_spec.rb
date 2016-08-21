require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    it '本文が必須であること' do
      comment = Comment.new
      comment.valid?
      expect(comment.errors[:body]).to include('を入力してください')
    end
  end
end
