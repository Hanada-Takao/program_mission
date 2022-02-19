# == Schema Information
#
# Table name: relationships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :bigint           not null
#  following_id :bigint           not null
#
require 'rails_helper'

RSpec.describe Relationship, type: :system do
  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }

  describe 'フォロー登録・解除のテスト' do
    context 'ログインユーザーが他のユーザーをフォローする' do
      it 'フォローしてから、フォロー解除が成功' do
        admin_login
        visit user_path(user_b)
        click_on 'フォロー'
        expect(page).to have_content '1 フォロワー'
        visit user_path(user_b)
        click_on 'フォロー解除'
        expect(page).to have_content '0 フォロワー'
      end
    end
  end
end