# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

User.create!(
  email: 'admin@admin.com',
  user_name: 'Admin_User',
  password: 'password',
  admin: 'true'
)
10.times do |n|
  user = User.create!(
    user_name: "sample_name#{n + 1}",
    email: "sample#{n + 1}@sample.com",
    password: 'password',
  )
  user.image.attach(io: File.open(Rails.root.join("app/assets/images/user_#{n + 1}.jpg")),
                  filename: "user_#{n + 1}.jpg")
end

13.times do |n|
  blog = Blog.create!(
    title: "sample_name#{n + 1}",
    content: "sample_content#{n + 1}",
    user_id: "#{User.all.pluck(:id).sample}"
  )
  blog.images.attach(io: File.open(Rails.root.join("app/assets/images/blog_#{n + 1}.jpg")),
                  filename: "blog_#{n + 1}.jpg")
end

  Tag.create([
    { tag_name: 'HTML' },
    { tag_name: 'CSS' },
    { tag_name: 'JavaScript' },
    { tag_name: 'Ruby' },
    { tag_name: 'Ruby on Rails' },
    { tag_name: '漢字' },
    { tag_name: '英語' }
  ])

30.times do |n|
  Mission.create!(
    input_main: "sample_input_main#{n + 1}",
    input_reading: "sample_input_reading#{n + 1}",
    input_library: "sample_input_library#{n + 1}",
    input_alias: "sample_input_alias#{n + 1}",
    input_related: "sample_input_related#{n + 1}",
    input_sample: "sample_input_sample#{n + 1}",
    input_description: "sample_input_description#{n + 1}",
    input_reference_site: "sample_input_reference_site#{n + 1}",
    input_remarks: "sample_input_remarks#{n + 1}",
    user_id: "#{User.all.pluck(:id).sample}"
  )
end

Mission.all.ids.sort.each do |mission_id|
  Tag.all.ids.sort.each do |tag_id|
    MissionTagsRelation.create!(mission_id: mission_id, tag_id: tag_id)
  end
end

30.times do |n|
  Comment.create!(
    comment_name: "sample#{n + 1}",
    comment: "sample_comment#{n + 1}",
    user_id: "#{User.all.pluck(:id).sample}",
    blog_id: "#{Blog.all.pluck(:id).sample}",
  )
end
10.times do |n|
Conversation.create!(
  recipient_id: "#{n + 1}",
  sender_id: "#{2 + 1}"
)
end

10.times do |n|
  Message.create!(
    body: "sample_message#{n + 1}",
    conversation_id: "#{n + 1}",
    user_id: "#{1}",
  )
end

User.all.ids.sort.each do |user_id|
  Blog.all.ids.sort.each do |blog_id|
    Favorite.create!(user_id: user_id, blog_id: blog_id)
  end
end

User.all.ids.sort.each do |following_id|
  User.all.ids.sort.each do |follower_id|
    Relationship.create!(following_id: following_id, follower_id: follower_id)
  end
end



