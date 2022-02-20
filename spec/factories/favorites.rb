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
# Indexes
#
#  index_favorites_on_blog_id  (blog_id)
#  index_favorites_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :favorite_1, class: Favorite do
    user_id { 2 }
    blog_id { 1 }
  end

  factory :favorite_2, class: Favorite do
    user_id { 3 }
    blog_id { 1 }
  end

end
