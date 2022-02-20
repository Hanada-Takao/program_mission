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

RSpec.describe 'mission管理機能', type: :system do
  let!(:user_a) { create(:user_admin) }
  let!(:mission_a) { create(:mission_1) }
  let!(:mission_b) { create(:mission_2) }
  let!(:mission_c) { create(:mission_3) }
  let!(:tag_a) { create(:tag_1) }
  let!(:tag_b) { create(:tag_2) }

  describe 'mission登録のテスト' do
    context 'missionを新規作成した場合' do
      it 'missionの新規作成が成功' do
        admin_login
        visit new_mission_path
        fill_in 'mission[input_main]',	with: 'test_method'
        click_button '保存'
        expect(page).to have_content '「test_methodのミッションを作成しました」'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのmission一覧が表示される' do
        admin_login
        visit missions_path
        current_path
        Mission.count
        page.html
        expect(page).to have_content 'input_main１'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のmission詳細画面に遷移した場合' do
      it '該当missionの内容が表示される' do
        admin_login
        visit mission_path(mission_a)
        expect(page).to have_content 'input_main１'
      end
    end
  end

  describe 'mission編集機能' do
    context '任意のmissionを編集・保存した場合' do
      it '該当missionの内容が更新される' do
        admin_login
        visit edit_mission_path(mission_c)
        check 'Factoryで作ったデフォルトのtag１'
        check 'Factoryで作ったデフォルトのtag２'
        click_button '保存'
        expect(page).to have_content 'program mission'
      end
    end
  end

  describe 'missionの削除機能' do
    context '任意のmission詳細画面に遷移した場合' do
      it '該当missionの削除が表示される' do
        admin_login
        visit mission_path(mission_a)
        click_button '削除'
        expect(page).to have_content '「input_main１のmissionが削除されました」'
      end
    end
  end

  describe '検索機能' do
    context 'input_mainで曖昧検索をした場合' do
      it "検索キーワードを含むmissionで絞り込まれる" do
        admin_login
        visit missions_path
        # missionの検索欄に検索ワードを入力する（例: mission）
        fill_in 'q[input_main_cont]', with: 'main２'
        # 検索ボタンを押す
        find('#institution_search_submit').click
        expect(page).to have_content 'main２'
      end
    end

    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するmissionが絞り込まれる" do
        admin_login
        visit missions_path
        # ここに実装する
        check 'Factoryで作ったデフォルトのtag１'
        # プルダウンを選択する「select」について調べてみる
        find('#institution_search_submit').click
        expect(page).to have_content 'Factoryで作ったデフォルトのtag１'
      end
    end

    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するmissionに絞り込まれる" do
        admin_login
        visit missions_path
        # ここに実装する
        check 'Factoryで作ったデフォルトのtag２'
        fill_in 'q[input_main_cont]', with: 'main３'
        find('#institution_search_submit').click
        expect(page).to have_content 'Factoryで作ったデフォルトのtag２'
      end
    end
  end
end

