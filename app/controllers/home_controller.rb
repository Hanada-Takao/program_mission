class HomeController < ApplicationController
  def top
  end

  def guest_admin_sign_in
    user = User.find_or_create_by!(email: 'guest_admin@example.com',
                                  admin: 'true' ) do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
      user.user_name = "ゲストアドミン"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲスト（管理者）ユーザーとしてログインしました。'
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
      user.user_name = "ゲスト"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
