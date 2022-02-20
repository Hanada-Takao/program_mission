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
FactoryBot.define do
  factory :conversation_1, class: Conversation do
    sender_id { "2" }
    recipient_id { "3" }
  end

  factory :conversation_2, class: Conversation do
    sender_id { "3" }
    recipient_id { "4" }
  end
end
