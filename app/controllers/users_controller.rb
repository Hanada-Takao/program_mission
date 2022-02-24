class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id).page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:page]).order("created_at DESC")
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー情報を更新しました。"
    else
    redirect_to edit_user_path, flash: {
      user: @user,
      error_messages: @user.errors.full_messages
    }
    end
  end

  def following
    user = User.find(params[:id])
    @users = user.following.page(params[:page]).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers.page(params[:page]).reverse_order
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :image)
  end
end
