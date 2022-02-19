class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :comment_name, presence: true, length: { maximum: 30 }
  validates :comment, presence: true, length: { maximum: 1000 }
end

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
