# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  icon                   :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  user_name              :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_a) { create(:user_admin) }
  let(:user_b) { create(:user_general) }

  describe 'ユーザーモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'userのnameとemailに内容が記載されている場合' do
        it 'バリデーションが通る' do
          expect(user_a).to be_valid
        end
      end

      context 'userのnameが空の場合' do
        it 'バリデーションにひっかる' do
          user_a.user_name = ' '
          expect(user_a).to be_invalid
        end
      end

      context 'userのemailが空の場合' do
        it 'バリデーションにひっかる' do
          user_a.email = ' '
          expect(user_a).to be_invalid
        end
      end

      context 'userのnameが30文字以上の場合' do
        it 'バリデーションにひっかる' do
          user_a.user_name = 'a' * 31
          expect(user_a).to be_invalid
        end
      end

      context 'userのemailが255文字以上の場合' do
        it 'バリデーションにひっかる' do
          user_a.email = 'a' * 245 + '@sample.com'
          expect(user_a).to be_invalid
        end
      end

      context 'メールフォーマットの検証' do
        it 'バリデーションにひっかる' do
          invalid_addresses = %w(userexample,com user_at_foo.org user.nameexample.
                                foobar_baz.com foobar+baz.com)
          invalid_addresses.each do |invalid_address|
            user_a.email = invalid_address
            expect(user_a).to be_invalid
          end
        end
      end

      context '重複するメールアドレスの拒否' do
        it "バリデーションにひっかる" do
          duplicate_user = user_a.dup
          user_a.save
          expect(duplicate_user).to be_invalid
        end
      end

      context 'passwordが5文字以下の場合' do
        it "バリデーションにひっかる" do
          user_a.password = 'a' * 5
          expect(user_a).to be_invalid
        end
      end
    end
  end
end