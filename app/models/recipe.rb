class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :cuisine
  
  has_many :item_ingredients, :as => :item, :order => 'item_order', :include => [:ingredient]
  has_many :ingredients, :through => :item_ingredients
  
  has_many :instructions, :order => 'recipe_order'
  
  has_many :notes, :as => :noteable
  
  has_many :meal_recipes
  has_many :meals, :through => :meal_recipes
  
  has_attached_file :image,{
    :styles => {
      :thumb   => ["75x75#", :jpg],
      :mid     => ["200x200#", :jpg],
      :small   => ["250", :jpg],
      :medium   => ["500", :jpg],
      :large => ["800", :jpg]
    },
    :default_url => "/images/question.png",
  }
end
