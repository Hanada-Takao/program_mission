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
  let!(:user_c) { create(:user_ordinary) }
  let!(:conversation_a) { create(:conversation_2) }

  context 'ユーザーidの重複' do
    it 'バリデーションに引っかかる' do
      message_room_1 = create(:conversation_1)
      message_room_1.save
      message_room_2 = Conversation.new(sender_id: user_a.id, recipient_id: user_b.id)
      expect(message_room_2).not_to be_valid
    end
  end

  context 'ユーザーidの重複' do
    it 'バリデーションが通る' do
      message_room_1 = create(:conversation_1)
      message_room_1.save
      message_room_2 = Conversation.new(sender_id: user_a.id, recipient_id: user_c.id)
      expect(message_room_2).to be_valid
    end
  end

  context "presence" do
    it "バリデーションに引っかかる sender_idが無い場合" do
      conversation_a.sender_id = nil
      expect(conversation_a).to be_invalid
    end
  end
  context "presence" do
    it "バリデーションに引っかかる recipient_idが無い場合" do
      conversation_a.recipient_id = nil
      expect(conversation_a).to be_invalid
    end
  end
end

