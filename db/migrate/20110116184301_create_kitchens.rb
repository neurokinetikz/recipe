class CreateKitchens < ActiveRecord::Migration
  def self.up
    create_table :kitchens do |t|
      t.column :user_id, :integer
      t.column :name, :string
      t.column :description, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :kitchens
  end
end
