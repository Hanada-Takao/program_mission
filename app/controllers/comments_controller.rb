class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.blog_id = params[:blog_id]
    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_back(fallback_location: root_path)
    else
      # flash[:comment] = comment
      # flash[:error_messages] = comment.errors.full_messages
      redirect_back(fallback_location: root_path)
      # redirect_to root_path, flash: {
      #   comment: @comment,
      #   error_messages: @comment.errors.full_messages
      # }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.blog, flash: { notice: 'コメントが削除されました' }
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_name, :comment, :blog_id)
  end
end