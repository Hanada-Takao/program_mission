# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  comment      :text             not null
#  comment_name :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  blog_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_comments_on_blog_id  (blog_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe 'コメント管理機能', type: :system do
  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }
  let!(:blog_a) { create(:blog_1) }
  let!(:comment_a) { create(:comment_1) }

  describe 'コメント登録のテスト' do
    context 'コメントを新規作成した場合' do
      it 'コメントの新規作成が成功' do
        admin_login
        visit blog_path(blog_a)
        fill_in 'comment[comment_name]',	with: 'testのコメント名'
        fill_in 'comment[comment]', with: 'testのコメント'
        click_button '送信'
        expect(page).to have_content 'testのコメント名'
      end
    end
  end

  describe 'コメントの削除機能' do
    context '任意のブログ詳細画面に遷移した場合' do
      it '該当コメントの削除が表示される' do
        admin_login
        visit blog_path(blog_a)
        find(".fa-trash").click
        expect(page).to have_content 'コメントが削除されました'
      end
    end
  end
end
