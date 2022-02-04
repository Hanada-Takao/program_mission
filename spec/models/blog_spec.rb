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
require 'rails_helper'

RSpec.describe Blog, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
