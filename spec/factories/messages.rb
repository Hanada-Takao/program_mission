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
FactoryBot.define do
  factory :message_1, class: Message do
    body { "test_message_1" }
    conversation_id { 1 }
    user_id { 2 }
  end

  factory :message_2, class: Message do
    body { "test_message_2" }
    conversation_id { 2 }
    user_id { 3 }
  end
end
