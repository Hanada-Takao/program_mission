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
FactoryBot.define do
  factory :relationship_1, class: Relationship do
    following_id { 2 }
    follower_id { 3 }
  end
  factory :relationship_2, class: Relationship do
    following_id { 3 }
    follower_id { 4 }
  end
  factory :relationship_3, class: Relationship do
    following_id { 3 }
    follower_id { 2 }
  end
end
