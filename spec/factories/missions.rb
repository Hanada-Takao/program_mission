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
  factory :mission_1 , class: Mission do
    input_main { "input_main１" }
    input_reading { "input_reading１" }
    input_library { "input_library１" }
    input_alias { "input_alias１" }
    input_related { "input_related１" }
    input_sample { "input_sample１" }
    input_description { "input_description１" }
    input_reference_site { "input_reference_site１" }
    input_remarks { "input_remarks１" }
    user_id { 1 }
  end

  factory :mission_2 , class: Mission do
    input_main { "input_main２" }
    input_reading { "input_reading２" }
    input_library { "input_library２" }
    input_alias { "input_alias２" }
    input_related { "input_related２" }
    input_sample { "input_sample２" }
    input_description { "input_description２" }
    input_reference_site { "input_reference_site２" }
    input_remarks { "input_remarks２" }
    user_id { 1 }
  end

  factory :mission_3 , class: Mission do
    input_main { "input_main３" }
    input_reading { "input_reading３" }
    input_library { "input_library３" }
    input_alias { "input_alias３" }
    input_related { "input_related３" }
    input_sample { "input_sample３" }
    input_description { "input_description３" }
    input_reference_site { "input_reference_site３" }
    input_remarks { "input_remarks３" }
    user_id { 1 }
  end
end
