class IngredientsController < ApplicationController
  before_filter :load_ingredient, :only => [:show]
  
  in_place_edit_for :ingredient, :name
  
  def create
    @ingredient = Ingredient.new params[:ingredient]
    @ingredient.save
    redirect_to ingredients_path
  end
  
  private
  def load_ingredient
    @ingredient = Ingredient.find params[:id]
  end
end