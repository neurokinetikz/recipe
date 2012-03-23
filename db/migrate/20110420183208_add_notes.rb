class AddNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.column :user_id, :integer
      t.column :noteable_type, :string
      t.column :noteable_id, :integer
      t.column :text, :text
      t.timestamps
    end
    
    add_index :notes, :user_id
    add_index :notes, [:noteable_type, :noteable_id]
  end

  def self.down
    drop_table :notes
  end
end
