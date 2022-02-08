# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  comment      :text             not null
#  comment_name :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  blog_id      :bigint           not null
#  user_id      :bigint           not null
#
FactoryBot.define do
  factory :comment do
    user_id { "" }
    blog_id { "" }
    comment_name { "MyString" }
    comment { "MyText" }
  end
end
