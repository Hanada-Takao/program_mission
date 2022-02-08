class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.blog_id = params[:blog_id]
    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_back(fallback_location: root_path)
    else
      # @blog = blog.find(params[:blog_id])
      # @comments = @blog.comments
      flash[:error_messages] = comment.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_name, :comment, :blog_id)
  end
end