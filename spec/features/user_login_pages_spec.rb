require 'rails_helper'

feature 'ログインとログアウト', type: :feature do
  scenario 'ログイン画面へ遷移' do
    visit root_path
    expect(current_path).to eq('/home')
  end

  scenario 'ログイン失敗' do
    visit new_user_session_path
    fill_in 'Email', with: 'foo@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content 'メールアドレスまたはパスワードが無効です。'
  end

  scenario 'ログイン成功' do
    create(:user)
    visit new_user_session_path
    fill_in 'Email', with: 'yamada@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content 'ログインしました。'
  end
end