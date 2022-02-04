class Blog < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
end

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
