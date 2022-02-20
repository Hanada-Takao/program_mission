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

RSpec.describe Favorite, type: :model do
  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }
  let!(:blog_a) { create(:blog_1) }
  let!(:blog_b) { create(:blog_2) }
  let!(:favorite_b) { create(:favorite_2) }

  context 'ユーザーidの重複' do
    it 'バリデーションに引っかかる' do
      like_1 = create(:favorite_1)
      like_1.save
      like_2 = Favorite.new(user_id: user_a.id, blog_id: blog_a.id)
      expect(like_2).not_to be_valid
    end
  end

  context 'ユーザーidの重複' do
    it 'バリデーションが通る' do
      like_1 = create(:favorite_1)
      like_1.save
      like_2 = Favorite.new(user_id: user_b.id, blog_id: blog_b.id)
      expect(like_2).to be_valid
    end
  end

  context "presence" do
    it "バリデーションに引っかかる user_idが無い場合" do
      favorite_b.user_id = nil
      expect(favorite_b).to be_invalid
    end
  end

  context "presence" do
    it "バリデーションに引っかかる blog_idが無い場合" do
      favorite_b.blog_id = nil
      expect(favorite_b).to be_invalid
    end
  end
end
