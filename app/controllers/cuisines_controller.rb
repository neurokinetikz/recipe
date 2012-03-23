class CuisinesController < ApplicationController
  def create
    @cuisine = Cuisine.new params[:cuisine]
    @cuisine.save
    redirect_to cuisines_path
  end
end
