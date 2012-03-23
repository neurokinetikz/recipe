class Kitchen < ActiveRecord::Base
  belongs_to :user
  
  has_many :kitchen_ingredients, :class_name => 'ItemIngredient', :as => :item, :include => [:ingredient]
  has_many :ingredients, :through => :kitchen_ingredients
end
