class Relationship < ApplicationRecord

  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"

  validates_uniqueness_of :follower_id, scope: :following_id
end

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
