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
5.times do |n|
  user = User.create!(
    user_name: "sample_name#{n + 1}",
    email: "sample#{n + 1}@sample.com",
    password: 'password',
  )
  user.image.attach(io: File.open(Rails.root.join("app/assets/images/user_#{n + 1}.jpg")),
                  filename: "user_#{n + 1}.jpg")
end

5.times do |n|
  Blog.create!(
    title: "sample_name#{n + 1}",
    content: "sample_description#{n + 1}",
    user_id: "#{User.all.pluck(:id).sample}"
  )
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
