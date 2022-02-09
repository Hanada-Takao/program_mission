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
#  user_id    :bigint           not null
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
