class BlogsController < ApplicationController
  before_action :set_target_blog, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[show create]

  def index
    @blogs = Blog.page(params[:page])
  end

  def new
    @blog = Blog.new(flash[:blog])
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    binding.pry
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
    # @comment = @blog.comments.new
    # @comment = Comment.new
  end

  def edit
    @blog = Blog.find(params[:id])
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
    blog.destroy
    redirect_to blogs_path, flash: { notice: "「#{blog.title}のブログが削除されました」"}
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end

  def set_target_blog
    @blog = Blog.find(params[:id])
  end
end