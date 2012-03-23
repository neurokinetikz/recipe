class ItemIngredientsController < ApplicationController
  before_filter :load_item_ingredient, :only => [:destroy]
  
  def create
    @item_ingredient = ItemIngredient.new params[:item_ingredient]
    @item_ingredient.save
    
    respond_to do |format|
      format.js{
        render :update do |page|
          if @item_ingredient.item.is_a?(Recipe)
            @recipe = @item_ingredient.item
            page.replace_html "ingredients", :partial => 'recipes/ingredients'
          end
        end
      }
      format.html{
        if @item_ingredient.item.is_a?(Recipe)
          redirect_to recipe_path @item_ingredient.item
        end
      }
    end
  end
  
  def destroy
    @item = @item_ingredient.item
    @item_ingredient.destroy
    
    respond_to do |format|
      format.js{
        render :update do |page|
          if @item.is_a?(Recipe)
            @recipe = @item
            page.replace_html "ingredients", :partial => 'recipes/ingredients'
          end
        end
      }
    end
  end
  
  private
  def load_item_ingredient
    @item_ingredient = ItemIngredient.find params[:id]
  end
end
