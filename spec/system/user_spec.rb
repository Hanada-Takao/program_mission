# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  icon                   :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  user_name              :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :system do
  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }

    describe 'ユーザ登録のテスト' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            visit new_user_registration_path
            fill_in 'user[user_name]', with:'general@general.com'
            fill_in 'user[email]', with: 'general@general.com'
            fill_in 'user[password]', with: 'general@general.com'
            fill_in 'user[password_confirmation]', with: 'general@general.com'
            click_button '新規登録'
            expect(page).to have_content 'アカウント登録が完了しました。'
          end
          it 'ログインせずユーザー一覧画面に飛ぼうとしたとき、ログイン画面に遷移すること' do
            visit users_path
            expect(page).to have_content 'ログインもしくはアカウント登録してください。'
          end
        end
      end
    end

    describe 'セッション機能のテスト' do
      context 'ログインしていない時' do
        it 'ログインができること' do
          general_login
          expect(page).to have_content 'ログインしました'
        end
      end
      context 'ログインした後' do
        it 'ログアウトができること' do
          general_login
          visit users_path
          click_on 'ログアウト'
          expect(page).to have_content 'ログアウトしました'
        end
      end
    end

    describe '管理画面のテスト' do
      context '管理ユーザーでログインしている' do
        it '管理ユーザは管理画面にアクセスできること' do
          admin_login
          visit rails_admin_path
          expect(page).to have_content 'Program Mission Admin'
        end
      end
      context '一般ユーザーでログインしている' do
        it '一般ユーザは管理画面にアクセスできないこと' do
          general_login
          visit rails_admin_path
          expect(page).to have_content 'アクセス権限がありません'
        end
      end
    end
  end