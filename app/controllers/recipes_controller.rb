class RecipesController < ApplicationController
  before_filter :load_recipe, :only => [:show, :edit, :update]
  
  in_place_edit_for :recipe, :description
  in_place_edit_for :recipe, :preparation_time
  in_place_edit_for :recipe, :cooking_time
  in_place_edit_for :recipe, :serves
  
  in_place_edit_for :instruction, :description
  
  def create
    @recipe = Recipe.new params[:recipe]
    @recipe.save
    redirect_to recipes_path
  end
  
  def update
    @recipe.update_attributes params[:recipe]
    redirect_to recipe_path @recipe
  end
  
  def edit
    render :show
  end
  
  private
  def load_recipe
    @recipe = Recipe.find params[:id]
  end
end