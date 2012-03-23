class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.column :user_id, :integer
      t.column :name, :string
      t.column :description, :text
      t.timestamps
    end
    
    add_index :meals, :user_id
  end

  def self.down
    drop_table :meals
  end
end
