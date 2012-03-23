class CreateListItems < ActiveRecord::Migration
  def self.up
    create_table :list_items do |t|
      t.column :list_id, :integer
      t.column :listable_type, :string
      t.column :listable_id, :integer
      t.column :list_order, :integer
      t.column :quantity, :string
      t.column :unit_id, :integer
      t.timestamps
    end
    
    add_index :list_items, :list_id
    add_index :list_items, [:listable_type, :listable_id]
    add_index :list_items, :unit_id
  end

  def self.down
    drop_table :list_items
  end
end
