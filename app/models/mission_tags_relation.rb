class MissionTagsRelation < ApplicationRecord
  belongs_to :mission
  belongs_to :tag
end

# == Schema Information
#
# Table name: mission_tags_relations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mission_id :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_mission_tags_relations_on_mission_id  (mission_id)
#  index_mission_tags_relations_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (mission_id => missions.id)
#  fk_rails_...  (tag_id => tags.id)
#
