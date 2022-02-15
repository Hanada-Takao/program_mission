class Tag < ApplicationRecord
  has_many :mission_tags_relations, dependent: :destroy
  has_many :missions, through: :mission_tags_relations
end

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  tag_name   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
