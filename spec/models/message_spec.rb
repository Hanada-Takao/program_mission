# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text             not null
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Message, type: :model do
  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }
  let!(:user_c) { create(:user_ordinary) }
  let!(:conversation_a) { create(:conversation_1) }
  let!(:message_a) { create(:message_1) }

  describe 'messageモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context ' message の body に内容が記載されている場合' do
        it 'バリデーションが通る' do
          expect(message_a).to be_valid
        end
      end

      context ' message の body が空の場合' do
        it 'バリデーションにひっかる' do
          message_a.body = ' '
          expect(message_a).not_to be_valid
        end
      end

      context ' message の body が100文字以上の場合' do
        it 'バリデーションにひっかる' do
          message_a.body = 'a' * 101
          expect(message_a).to be_invalid
        end
      end
    end
  end
end
