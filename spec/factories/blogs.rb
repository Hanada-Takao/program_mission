# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  content    :text
#  image      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :bigint
#  user_id    :bigint
#
FactoryBot.define do
  factory :blog do
    user_id { "" }
    blog_id { "" }
    title { "MyString" }
    content { "MyText" }
    image { "MyString" }
  end
end
