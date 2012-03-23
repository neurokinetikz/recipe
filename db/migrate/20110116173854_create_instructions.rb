class CreateInstructions < ActiveRecord::Migration
  def self.up
    create_table :instructions do |t|
      t.column :recipe_id, :integer
      t.column :recipe_order, :integer
      t.column :description, :text
      t.timestamps
    end
    
    add_index :instructions, :recipe_id
  end

  def self.down
    drop_table :instructions
  end
end
