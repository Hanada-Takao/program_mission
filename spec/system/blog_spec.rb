# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  content    :text
#  image      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
require 'rails_helper'

RSpec.describe 'ブログ管理機能', type: :system do
  let!(:user_a) { create(:user_admin) }
  let!(:blog_a) { create(:blog_1) }
  let!(:blog_b) { create(:blog_2) }
  let!(:blog_c) { create(:blog_3) }

  describe 'ブログ登録のテスト' do
    context 'ブログを新規作成した場合' do
      it 'ブログの新規作成が成功' do
        admin_login
        visit new_blog_path
        fill_in 'blog[title]',	with: 'タイトル'
        fill_in 'blog[content]', with: 'コンテンツ'
        click_button '保存'
        expect(page).to have_content '「タイトルのブログを作成しました」'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのブログ一覧が表示される' do
        admin_login
        visit blogs_path
        current_path
        Blog.count
        page.html
        expect(page).to have_content 'Factoryで作ったデフォルトのtitle１'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のブログ詳細画面に遷移した場合' do
      it '該当ブログの内容が表示される' do
        admin_login
        visit blog_path(blog_a)
        expect(page).to have_content 'Factoryで作ったデフォルトのtitle１'
      end
    end
  end

  describe 'ブログ編集機能' do
    context '任意のブログを編集・保存した場合' do
      it '該当ブログの内容が更新される' do
        admin_login
        visit edit_blog_path(blog_a)
        click_button '保存'
        expect(page).to have_content '更新に成功しました。'
      end
    end
  end

  describe 'ブログの削除機能' do
    context '任意のブログ詳細画面に遷移した場合' do
      it '該当ブログの削除が表示される' do
        admin_login
        visit blog_path(blog_a)
        click_button '削除'
        expect(page).to have_content '「Factoryで作ったデフォルトのtitle１のブログが削除されました」'
      end
    end
  end
end