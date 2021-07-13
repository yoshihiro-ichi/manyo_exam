require 'rails_helper'

RSpec.describe 'セッション機能のテスト', type: :feature do
  it 'ログインする' do
    # トップページを開く
    visit  new_session_path
    # ログインフォームにEmailとパスワードを入力する
    # fill_in 'name' , with: 'テストユーザー'
    fill_in 'session[email]', with: "test@a.com"
    fill_in 'session[password]', with: '111111'
    # ログインボタンをクリックする
    click_on 'commit'
    # ログインに成功したことを検証する
    expect(page).to have_content 'ログインしました'
  end
  it 'ログアウトする'do
    visit new_session_path
    fill_in :session_email, with: 'test@a.com'
    fill_in :session_password, with: "111111"
    click_on 'commit'
    # visit tasks_path
    sleep 0.3

    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました'
  end
  context '詳細ページに飛べるテスト' do
    it '自分の詳細ページに飛べること' do
      visit new_session_path
      fill_in :session_email, with: "test@a.com"
      fill_in :session_password, with: "111111"
      click_on 'commit'
      expect(page).to have_content 'test@a.com'
    end
  end
  describe 'ユーザー機能のテスト'do
    before do
      visit new_user_path
    end
    context 'ユーザーが新規登録をする場合' do
      it '新規登録ができること'do
        fill_in :user_name,with: "坊主"
        fill_in :user_email,with: "aaaa@a.com"
        fill_in :user_password,with: "111111"
        fill_in :user_password_confirmation, with: "111111"
        click_on 'commit'
        expect(page).to have_content 'aaaa@a.com'
      end
    end
    context 'ユーザーがログインせずにタスク一覧に飛ぼうとした場合' do
      it 'ログイン画面に遷移すること'do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end
  describe 'ユーザー機能のテスト'do
    before do
      @user = FactoryBot.create(:user, email:'tac@a.com' ,password: "111111")
      @second_user = FactoryBot.create(:second_user, email:'tack@a.com',password: "111111")
    end
    context '一般ユーザーが他人の詳細画面に飛んだ場合' do
      it 'タスク一覧に遷移すること' do
      visit new_session_path
        fill_in :session_email,with: "tac@a.com"
        fill_in :session_password,with: "111111"
        click_on 'commit'
        visit user_path (@second_user.id)
          # binding.irb
        expect(page).to have_content "タスク一覧"
      end
    end
  end
  describe '管理者機能'do
    before do
     @admin_user = FactoryBot.create(:second_user,email:'tack@a.com')
     @user =  FactoryBot.create(:user,email:'tac@a.com')
    end
    context '管理ユーザーが管理画面にアクセスした場合' do
      it '管理画面に遷移できる' do
        visit new_session_path
        fill_in :session_email,with:'tack@a.com'
        fill_in :session_password,with: "111111"
        click_on 'commit'
         # binding.irb
        click_link '管理者ページ'
        expect(page).to have_content "管理者ページ"
      end
    end
    context '一般ユーザーが管理画面にアクセスした場合' do
      it 'タスク一覧画面に戻る' do
        visit new_session_path
        fill_in :session_email,with:'test@a.com'
        fill_in :session_password,with: "111111"
        click_on 'commit'
        click_link '管理者ページ'
        expect(page).to have_content "タスク一覧"
      end
    end
    context '管理ユーザーがユーザーの詳細にアクセスした場合' do
      it 'ユーザー詳細に遷移できる' do
        visit new_session_path
        fill_in :session_email,with:'tack@a.com'
        fill_in :session_password,with: "111111"
        click_on 'commit'
        sleep 0.3
        visit admin_user_path (@user.id)
        expect(page).to have_content "テストユーザーのページ"
      end
    end
    context '管理ユーザーがユーザーの編集にアクセスした場合' do
      it 'ユーザー編集ページに遷移し編集できる' do
        visit new_session_path
        fill_in :session_email,with:'tack@a.com'
        fill_in :session_password,with: "111111"
        click_on 'commit'
        sleep 0.3
        visit edit_admin_user_path (@user.id)
        fill_in :user_name,with: "坊主"
        fill_in :user_email,with: "aaaa@a.com"
        fill_in :user_password,with: "111111"
        fill_in :user_password_confirmation, with: "111111"
        select '一般', from: 'user[admin]'
        click_on 'commit'
      end
    end
  end
end
