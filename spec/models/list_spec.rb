require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'validation' do
    it 'リスト名が必須であること' do
      list = List.new
      list.valid?
      expect(list.errors[:name]).to include('を入力してください')
    end
  end
end
