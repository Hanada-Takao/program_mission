class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    #投稿に紐づいたコメントを作成
    @comment = @blog.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment_blog = @comment.blog
    if @comment.save
      @comment_blog.create_notification_comment!(current_user, @comment.id)
      redirect_to blog_path(@blog), notice: "「#{@comment.comment_name}のコメントをしました」"
    else
      redirect_to blog_path(@blog), notice: '投稿できませんでした...'
    end
  end
      # # flash[:comment] = comment
      # # flash[:error_messages] = comment.errors.full_messages
      # redirect_back(fallback_location: root_path)
      # # redirect_to root_path, flash: {
      # #   comment: @comment,
      # #   error_messages: @comment.errors.full_messages
      # # }
  #   end
  # end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.blog, flash: { notice: 'コメントが削除されました' }
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_name, :comment, :blog_id, :user_id)
  end
end