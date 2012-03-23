class Meal < ActiveRecord::Base
  belongs_to :user
  
  has_many :meal_recipes
  has_many :recipes, :through => :meal_recipes
end
