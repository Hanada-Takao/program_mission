class BlogsController < ApplicationController
  before_action :set_target_blog, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[show create]

  def index
    #フォローしているユーザーと自分の投稿
    @blogs = Blog.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page])
    # @blog = Blog.new
  end

  def new
    @blog = Blog.new(flash[:blog])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog), flash: { notice: "「#{@blog.title}のブログを作成しました」"}
    else
      redirect_to new_blog_path, flash: {
        blog: @blog,
        error_messages: @blog.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(blog_id: @blog.id)
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    @comments = @blog.comments.order(created_at: :desc)
    # @comment = @blog.comments.new
    # @comment = Comment.new
  end

  def edit
    if @blog.user != current_user
      redirect_to blogs_path, alert: '不正なアクセスです。'
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: '更新に成功しました。'
    else
      redirect_to edit_blog_path, flash: {
        blog: @blog,
        error_messages: @blog.errors.full_messages
      }
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, flash: { notice: "「#{@blog.title}のブログが削除されました」"}
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, images: [])
  end

  def set_target_blog
    @blog = Blog.find(params[:id])
  end
end