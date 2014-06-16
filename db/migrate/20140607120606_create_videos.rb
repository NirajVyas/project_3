class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :id
      t.string :title
      t.string :link
      t.string :uid
      t.string :author
      t.string :duration
      t.integer :likes
      t.integer :dislikes
      t.integer :post_id
      t.timestamps
    end
  end
end
