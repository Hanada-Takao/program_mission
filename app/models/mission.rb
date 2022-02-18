class Mission < ApplicationRecord
  belongs_to :user

  has_many :mission_tags_relations, dependent: :destroy
  has_many :tags, through: :mission_tags_relations

  validates :input_main, presence: true, length: { maximum: 30 }
  validates :input_alias, length: { maximum: 255 }
  validates :input_description, length: { maximum: 255 }
  validates :input_library, length: { maximum: 255 }
  validates :input_reading, length: { maximum: 255 }
  validates :input_reference_site, length: { maximum: 255 }
  validates :input_related, length: { maximum: 255 }
  validates :input_remarks, length: { maximum: 255 }
  validates :input_sample, length: { maximum: 255 }
end

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
