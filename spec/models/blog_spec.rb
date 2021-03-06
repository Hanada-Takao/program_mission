# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  image      :string
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_blogs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Blog, type: :model do
  let!(:user_a) { create(:user_admin) }
  let!(:blog_a) { create(:blog_1) }

  describe 'ブログモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'ブログのタイトルと詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
          expect(blog_a).to be_valid
        end

        context 'blogのtitleが空の場合' do
          it 'バリデーションにひっかる' do
            blog_a.title = ' '
            expect(blog_a).not_to be_valid
          end
        end

        context 'blogのcontentが空の場合' do
          it 'バリデーションにひっかかる' do
            blog_a.content = ' '
            expect(blog_a).not_to be_valid
          end
        end

        context 'blogのtitleが30文字以上の場合' do
          it 'バリデーションにひっかる' do
            blog_a.title = 'a' * 31
            expect(blog_a).to be_invalid
          end
        end

        context 'blogのcontentが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            blog_a.content = 'a' * 1000 + 'サンプルコンテンツ'
            expect(blog_a).to be_invalid
          end
        end
      end
    end
  end
end
