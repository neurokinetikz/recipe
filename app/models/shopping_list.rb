class ShoppingList < List
  has_many :list_ingredients, :class_name => 'ItemIngredient', :as => :item, :include => {:ingredient, :unit}
  has_many :ingredients, :through => :list_ingredients
end
