class ProfilesController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
      end
    end
  end

  def index
    @profiles = User.where(public: true)
  end

  def show
    @profiles = User.all
  end

end
