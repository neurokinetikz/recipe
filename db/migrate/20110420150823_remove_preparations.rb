class RemovePreparations < ActiveRecord::Migration
  def self.up
    drop_table :preparations
    change_column :item_ingredients, :preparation_id, :string
    rename_column :item_ingredients, :preparation_id, :preparation
  end

  def self.down
  end
end
