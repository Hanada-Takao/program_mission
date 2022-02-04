class BlogsController < ApplicationController
before_action :set_target_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.page(params[:page])
  end

  def new
    @blog = Blog.new(flash[:blog])
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      redirect_to blog, flash: { notice: "「#{@blog.title}のブログを作成しました」"}
    else
      redirect_to new_blog_path, flash: {
        blog: blog,
        error_messages: blog.errors.full_messages
      }
    end
  end

  def show
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to @blog
  end

  def destroy
    @blog.delete
    redirect_to blogs_path, flash: { notice: "「#{@blog.title}のブログが削除されました」"}
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end

  def set_target_blog
    @blog = Blog.find(params[:id])
  end
end