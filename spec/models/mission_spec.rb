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
require 'rails_helper'

RSpec.describe Mission, type: :model do
  let!(:user_a) { create(:user_admin) }
  let!(:mission_a) { create(:mission_1) }

  describe 'missionモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'missionのinput_mainに内容が記載されている場合' do
        it 'バリデーションが通る' do
          expect(mission_a).to be_valid
        end

        context 'missionのinput_mainが空の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_main = ' '
            expect(mission_a).not_to be_valid
          end
        end

        context 'missionのtitleが30文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_main = 'a' * 31
            expect(mission_a).to be_invalid
          end
        end

        context 'missionのinput_aliasが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_alias = 'a' * 256
            expect(mission_a).to be_invalid
          end
        end

        context 'missionのinput_descriptionが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_description = 'a' * 256
            expect(mission_a).to be_invalid
          end
        end

        context 'missionのinput_libraryが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_library = 'a' * 256
            expect(mission_a).to be_invalid
          end
        end

        context 'missionのinput_readingが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_reading = 'a' * 256
            expect(mission_a).to be_invalid
          end
        end

        context 'missionのinput_reference_siteが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_reference_site = 'a' * 256
            expect(mission_a).to be_invalid
          end
        end

        context 'missionのinput_relatedが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_related = 'a' * 256
            expect(mission_a).to be_invalid
          end
        end

        context 'missionのinput_remarksが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_remarks = 'a' * 256
            expect(mission_a).to be_invalid
          end
        end

        context 'missionのinput_sampleが255文字以上の場合' do
          it 'バリデーションにひっかる' do
            mission_a.input_sample = 'a' * 256
            expect(mission_a).to be_invalid
          end
        end
      end
    end
  end
end
