class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  with_options presence: true do
    validates :user_id
    validates :blog_id
  end
  validates_uniqueness_of :blog_id, scope: :user_id
end

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
