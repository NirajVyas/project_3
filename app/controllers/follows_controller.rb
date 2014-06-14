class FollowsController < ApplicationController

  def create
    user = current_user
    @user = User.find(params[:id])
    user.mark_as_favorite [ @user ]

    respond_to do |format|
        format.js {render '/blogs/follow.js.erb'}
        format.html { redirect_to :back }

      end 
  end

  def destroy
    user = current_user
    @user = User.find(params[:id])
    user.remove_mark :favorite, [ @user ]
    respond_to do |format|
        format.js {render '/blogs/follow.js.erb'}
        format.html { redirect_to :back }
      end 
  end


end
