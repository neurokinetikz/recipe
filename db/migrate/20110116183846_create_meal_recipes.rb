class CreateMealRecipes < ActiveRecord::Migration
  def self.up
    create_table :meal_recipes do |t|
      t.column :meal_id, :integer
      t.column :recipe_id, :integer
      t.timestamps
    end
    
    add_index :meal_recipes, :meal_id
    add_index :meal_recipes, :recipe_id
  end

  def self.down
    drop_table :meal_recipes
  end
end
