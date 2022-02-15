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
require 'rails_helper'

RSpec.describe MissionTagsRelation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
