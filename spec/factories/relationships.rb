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
  factory :relationship do
    following_id { 1 }
    follower_id { 1 }
  end
end
