# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  tag_name   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :tag_1, class: Tag do
    tag_name { 'Factoryで作ったデフォルトのtag１' }
  end

  factory :tag_2, class: Tag do
    tag_name { 'Factoryで作ったデフォルトのtag２' }
  end
end
