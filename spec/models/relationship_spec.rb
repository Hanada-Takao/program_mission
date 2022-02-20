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
  let!(:user_c) { create(:user_ordinary) }
  let!(:relationship_a) { create(:relationship_2) }


  context 'フォローの重複' do
    it 'バリデーションに引っかかる' do
      follow1 = create(:relationship_1)
      follow1.save
      follow2 = Relationship.new(follower_id: user_b.id, following_id: user_a.id)
      expect(follow2).not_to be_valid
    end
  end

  context 'フォローの重複' do
    it 'バリデーションが通る' do
      follow1 = create(:relationship_1)
      follow1.save
      follow2 = Relationship.new(follower_id: user_a.id, following_id: user_b.id)
      expect(follow2).to be_valid
    end
  end

  context "presence" do
    it "バリデーションに引っかかる follower_idが無い場合" do
      relationship_a.follower_id = nil
      expect(relationship_a).to be_invalid
    end
    it "バリデーションに引っかかる following_idが無い場合" do
      relationship_a.following_id = nil
      expect(relationship_a).to be_invalid
    end
  end
end
