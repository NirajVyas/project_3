class CitiesController < ApplicationController

 def create
    @city = City.create(params[:city])
    redirect_to root_path
  end

end
