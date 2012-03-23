class AddImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column :user_id, :integer
      t.column :source_type, :string
      t.column :source_id, :integer
      t.column :attachment_file_name, :string
      t.column :attachment_content_type, :string
      t.column :attachment_file_size, :integer
      t.column :attachment_updated_at, :datetime
      t.timestamps
    end
    
    add_index :images, :user_id
    add_index :images, [:source_type, :source_id]
  end

  def self.down
    drop_table :images
  end
end
