class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true, length: { maximum: 100 }

  validates_presence_of :conversation_id, :user_id
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end

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
