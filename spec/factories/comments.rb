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
# Indexes
#
#  index_comments_on_blog_id  (blog_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :comment_1, class: Comment do
    user_id { "2" }
    blog_id { "1" }
    comment_name { "test_comment_name_1" }
    comment { "test_comment_text_1" }
  end

  factory :comment_2, class: Comment do
    user_id { "3" }
    blog_id { "1" }
    comment_name { "test_comment_name_2" }
    comment { "test_comment_text_2" }
  end
end
