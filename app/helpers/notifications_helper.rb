module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    your_blog = link_to 'あなたの投稿', blogs_path(notification), style:"font-weight: bold;"
    @visitor_comment = notification.comment_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "follow" then
        tag.a(notification.visitor.user_name, href:user_path(@visitor), style:"font-weight: bold;")+"があなたをフォローしました"

      when "favorite" then
        tag.a(notification.visitor.user_name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:blogs_path(notification.blog_id), style:"font-weight: bold;")+"にいいねしました"

      when "comment" then
          @comment = Comment.find_by(id: @visitor_comment)&.comment_name
          tag.a(@visitor.user_name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:blogs_path(notification.blog_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end
