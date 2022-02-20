# == Schema Information
#
# Table name: conversations
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#
require 'rails_helper'

RSpec.describe Conversation, type: :model do

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

  context 'フォローの重複' do
    it 'バリデーションが通る' do
      follow1 = create(:relationship_1)
      follow1.save
      follow2 = Relationship.new(follower_id: user_a.id, following_id: user_b.id)
      expect(follow2).to be_valid
    end
  end
end
