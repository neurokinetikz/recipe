class CreateCuisines < ActiveRecord::Migration
  def self.up
    create_table :cuisines do |t|
      t.column :name, :string
      t.column :description, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :cuisines
  end
end
