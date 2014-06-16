module PostsHelper
  def build_comment_for_post post
    Comment.build_from( post, current_user.id, nil )
  end
end
