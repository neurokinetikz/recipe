class RemoveUnits < ActiveRecord::Migration
  def self.up
    drop_table :units
    change_column :item_ingredients, :unit_id, :string
    rename_column :item_ingredients, :unit_id, :unit
  end

  def self.down
  end
end
