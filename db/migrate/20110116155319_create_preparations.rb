class CreatePreparations < ActiveRecord::Migration
  def self.up
    create_table :preparations do |t|
      t.column :name, :string
      t.column :description, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :preparations
  end
end
