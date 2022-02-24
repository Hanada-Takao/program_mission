# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string           default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :bigint
#  comment_id :bigint
#  visited_id :integer          not null
#  visitor_id :integer          not null
#
# Indexes
#
#  index_notifications_on_blog_id     (blog_id)
#  index_notifications_on_comment_id  (comment_id)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#  fk_rails_...  (comment_id => comments.id)
#
FactoryBot.define do
  factory :notification do
    
  end
end
