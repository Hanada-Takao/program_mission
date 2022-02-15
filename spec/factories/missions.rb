# == Schema Information
#
# Table name: missions
#
#  id                   :bigint           not null, primary key
#  input_alias          :string
#  input_description    :text
#  input_library        :string
#  input_main           :string           not null
#  input_reading        :string
#  input_reference_site :string
#  input_related        :string
#  input_remarks        :text
#  input_sample         :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_missions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :mission do
    input_main { "MyString" }
    input_reading { "MyString" }
    input_library { "MyString" }
    input_alias { "MyString" }
    input_related { "MyString" }
    input_sample { "MyString" }
    input_description { "MyText" }
    input_reference_site { "MyString" }
    input_remarks { "MyText" }
    user { nil }
  end
end
