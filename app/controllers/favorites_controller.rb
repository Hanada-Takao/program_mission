class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.blog_id = params[:blog_id]

    if favorite.save
      favorite.blog_id.create_notification_favorite!(current_user)
      redirect_to blogs_path
    else
      redirect_to blogs_path, danger: 'お気に入り登録に失敗しました'
    end
    # @favorite = current_user.favorites.create(blog_id: params[:blog_id])
    # redirect_back(fallback_location: root_path)
  end

  def index
    @favorite_blogs = current_user.favorite_blogs
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end