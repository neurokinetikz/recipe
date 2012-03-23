class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.column :name, :string
      t.column :description, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
