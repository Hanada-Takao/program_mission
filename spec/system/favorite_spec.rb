# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_blog_id  (blog_id)
#  index_favorites_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Favorite, type: :system do
  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }
  let!(:blog_a) { create(:blog_1) }
  let!(:blog_b) { create(:blog_2) }
  let!(:relationship_a) { create(:relationship_3) }

  describe 'お気に入り登録のテスト' do
    context 'お気に入りを新規作成した場合' do
      it 'お気に入りの新規作成が成功' do
        general_login
        visit blog_path(blog_a)
        find(".fa-heart").click
        expect(page).to have_content '1'
      end
    end
  end
end
