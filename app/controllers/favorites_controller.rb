class FavoritesController < ApplicationController
  before_action :blog_params

  def create
    if
      favorite = current_user.favorites.new(blog_id: @blog.id)
      favorite.save
      @blog = Blog.find(params[:blog_id])
      @blog.create_notification_by(current_user)
      redirect_back(fallback_location: root_path)
    else
      redirect_to blogs_path, flash: {
        favorite: favorite,
        error_messages: favorite.errors.full_messages
      }
    end
  end

  def index
    @favorite_blogs = current_user.favorite_blogs
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, blog_id: @blog.id).destroy
    redirect_back(fallback_location: root_path)
  end
  # def destroy
  #   @blog = Blog.find(params[:blog_id])
  #   @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  #   @favorite.destroy
  #   redirect_back(fallback_location: root_path)
  # end
  private

  def blog_params
    @blog = Blog.find(params[:blog_id])
  end
end