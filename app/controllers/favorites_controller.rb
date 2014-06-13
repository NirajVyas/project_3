class FavoritesController < ApplicationController

  def create
    user = current_user
    @blog = Blog.find(params[:id])
    user.mark_as_favorite [ @blog ]

    respond_to do |format|
        format.js {render '/blogs/favorite.js.erb'}
        format.html { redirect_to :back }

      end 
  end

  def destroy
    user = current_user
    @blog = Blog.find(params[:id])
    user.remove_mark :favorite, [ @blog ]
    respond_to do |format|
        format.js {render '/blogs/favorite.js.erb'}
        format.html { redirect_to :back }
      end 
  end


end