class Relationship < ApplicationRecord
  validates :follower_id, presence: true
  validates :following_id, presence: true

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
#  follower_id  :integer
#  following_id :integer
#
# Indexes
#
#  index_relationships_on_follower_id                   (follower_id)
#  index_relationships_on_follower_id_and_following_id  (follower_id,following_id) UNIQUE
#  index_relationships_on_following_id                  (following_id)
#
