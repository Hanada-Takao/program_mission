# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text
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

RSpec.describe Message, type: :system do
  let!(:user_a) { create(:user_admin) }
  let!(:user_b) { create(:user_general) }
  let!(:conversation_a) { create(:conversation_1) }
  let!(:message_a) { create(:message_1) }

  describe 'メッセージ登録のテスト' do
    context 'メッセージを新規作成した場合' do
      it 'メッセージの新規作成が成功' do
        admin_login
        visit conversation_messages_path(conversation_a)
        fill_in 'message[body]',	with: 'testのメッセージ'
        click_button 'メッセージを送る'
        expect(page).to have_content 'testのメッセージ'
      end
    end
  end
end
