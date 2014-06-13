class HomeController < ApplicationController
    before_filter :authenticate_user!


def index
  @favourites = current_user.favorite_blogs
end


end
