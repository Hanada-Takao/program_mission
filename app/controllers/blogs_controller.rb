class BlogsController < ApplicationController
before_action :set_target_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.page(params[:page])
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.create(blog_params)
    redirect_to blog
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
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end

  def set_target_blog
    @blog = Blog.find(params[:id])
  end
end