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
