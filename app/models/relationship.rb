class Relationship < ApplicationRecord
    # フォローするユーザに結びついている
    belongs_to :following, class_name: "User"
    # フォローされるユーザに結びついている
    belongs_to :follower, class_name: "User"
end

# == Schema Information
#
# Table name: relationships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :integer          not null
#  following_id :integer          not null
#
