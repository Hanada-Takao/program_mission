# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  icon                   :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  user_name              :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user_admin, class: User do
    id {2}
    user_name { 'admin@test.com' }
    email {'admin@test.com'}
    password { 'admin@test.com' }
    admin { 'true' }
  end
end

FactoryBot.define do
  factory :user_general, class: User do
    id {3}
    user_name { 'general@test.com' }
    email {'general@test.com'}
    password { 'general@test.com' }
    admin { 'false' }
  end
end
