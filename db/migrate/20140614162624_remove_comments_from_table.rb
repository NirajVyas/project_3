class RemoveCommentsFromTable < ActiveRecord::Migration
  def up
    drop_table :comments
  end

  def down
       create_table :comments, :force => true do |t|
      t.integer :commentable_id, :default => 0
      t.string :commentable_type
      t.string :title
      t.text :body
      t.string :subject
      t.integer :user_id, :default => 0, :null => false
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end
    
    add_index :comments, :user_id
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
