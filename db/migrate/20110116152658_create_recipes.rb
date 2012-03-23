class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.column :user_id, :integer
      t.column :cuisine_id, :integer
      t.column :course_id, :integer
      t.column :name, :string, :null => false
      t.column :description, :text
      t.column :preparation_time, :integer
      t.column :cooking_time, :integer
      t.column :serves, :integer
      t.timestamps
    end
    
    add_index :recipes, :user_id
    add_index :recipes, :cuisine_id
    add_index :recipes, :course_id
  end

  def self.down
    drop_table :recipes
  end
end
