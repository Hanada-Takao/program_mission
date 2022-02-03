class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end
end