# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :bigint           not null
#  user_id    :bigint           not null
#
FactoryBot.define do
  factory :favorite do
    user_id { nil }
    blog_id { nil }
  end
end
