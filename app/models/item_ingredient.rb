class ItemIngredient < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :ingredient
end
