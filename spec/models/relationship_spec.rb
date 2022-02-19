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

RSpec.describe Relationship, type: :model do

  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }

  context 'フォローの重複' do
    it 'バリデーションに引っかかる' do
      follow1 = create(:relationship_1)
      follow1.save
      follow2 = Relationship.new(follower_id: user_b.id, following_id: user_a.id)
      expect(follow2).not_to be_valid
    end
  end
end
