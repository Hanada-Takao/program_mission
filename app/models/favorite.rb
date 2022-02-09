class Favorite < ApplicationRecord
  belongs_to :user_id
  belongs_to :blog_id

  with_options presence: true do
    validates :user_id
    validates :blog_id
  end
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
