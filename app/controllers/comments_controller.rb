class CommentsController < ApplicationController

  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])


    respond_to do |format|
      if @comment.save
        format.js {}
        format.html do
          redirect_to @comment.commentable.blog
          # render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created 
        end
      else
        format.js { render :js => "alert('error saving comment');" }
        format.html do
          redirect_to @comment.commentable.blog, alert: 'error saving comment'
        end      
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :json => @comment, :status => :ok
    else
      render :js => "alert('error deleting comment');"
    end
  end

end
