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
  factory :conversation do
    sender_id { "" }
    recipient_id { "" }
  end
end
