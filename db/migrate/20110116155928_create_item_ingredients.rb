class CreateItemIngredients < ActiveRecord::Migration
  def self.up
    create_table :item_ingredients do |t|
      t.column :item_type, :string
      t.column :item_id, :integer
      t.column :item_order, :integer
      t.column :ingredient_id, :integer
      t.column :quantity, :string
      t.column :unit_id, :integer
      t.column :preparation_id, :integer
      t.timestamps
    end
    
    add_index :item_ingredients, [:item_type, :item_id]
    add_index :item_ingredients, :ingredient_id
    add_index :item_ingredients, :unit_id
    add_index :item_ingredients, :preparation_id
  end

  def self.down
    drop_table :item_ingredients
  end
end
