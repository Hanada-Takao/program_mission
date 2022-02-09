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
