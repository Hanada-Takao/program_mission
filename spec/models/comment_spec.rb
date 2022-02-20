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

RSpec.describe Comment, type: :model do
  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }
  let!(:blog_a) { create(:blog_1) }
  let!(:comment_a) { create(:comment_1) }

  describe 'コメントモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'commentのnameとcommentに内容が記載されている場合' do
        it 'バリデーションが通る' do
          expect(comment_a).to be_valid
        end

        context 'commentのnameが空の場合' do
          it 'バリデーションにひっかる' do
            comment_a.comment_name = ' '
            expect(comment_a).not_to be_valid
          end
        end

        context 'commentの詳細が空の場合' do
          it 'バリデーションにひっかかる' do
            comment_a.comment = ' '
            expect(comment_a).not_to be_valid
          end
        end

        context 'commentのtitleが30文字以上の場合' do
          it 'バリデーションにひっかる' do
            comment_a.comment_name = 'a' * 31
            expect(comment_a).to be_invalid
          end
        end

        context 'commentのcontentが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            comment_a.comment = 'a' * 1000 + 'サンプルコンテンツ'
            expect(comment_a).to be_invalid
          end
        end
      end
    end
  end
end
