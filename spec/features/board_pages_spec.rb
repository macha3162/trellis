require 'rails_helper'

feature 'ボードの操作', type: :feature do
  before do
    create(:user)
    visit new_user_session_path
    fill_in 'Email', with: 'yamada@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
  end

  scenario 'ボード作成' do
    visit root_path
    find('#create_board').click
    expect(current_path).to eq('/boards/new')
    fill_in 'board_name', with: '新しいボード'
    click_on '登録する'
    expect(current_path).to eq('/boards/1')
    expect(page).to have_content '新しいボード'

    fill_in 'list_name', with: '新しいリスト'
    click_on '追加'
    expect(current_path).to eq('/boards/1')
    expect(page).to have_content 'リストを作成しました！'
  end
end