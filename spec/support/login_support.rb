module LoginSupport
  def admin_login
    visit new_user_session_path
    fill_in 'user[user_name]', with: 'Factoryで作ったUserAdmin'
    fill_in 'user[email]', with: 'admin@test.com'
    fill_in 'user[password]', with: 'admin@test.com'
    click_button 'ログイン'
  end

  def general_login
    visit new_user_session_path
    fill_in 'user[user_name]', with: 'Factoryで作ったUserGeneral'
    fill_in 'user[email]', with: 'general@test.com'
    fill_in 'user[password]', with: 'general@test.com'
    click_button 'ログイン'
  end
end