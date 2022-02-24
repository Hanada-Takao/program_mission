# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  image      :string
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_blogs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :blog_1 , class: Blog do
    title { 'Factoryで作ったデフォルトのtitle１' }
    content { 'Factoryで作ったデフォルトのcontent１' }
    user_id { 2 }
  end

  factory :blog_2 , class: Blog do
    title { 'Factoryで作ったデフォルトのtitle２' }
    content { 'Factoryで作ったデフォルトのcontent２' }
    user_id { 2 }
  end

  factory :blog_3 , class: Blog do
    title { 'Factoryで作ったデフォルトのtitle３' }
    content { 'Factoryで作ったデフォルトのcontent３' }
    user_id { 2 }
  end
end
