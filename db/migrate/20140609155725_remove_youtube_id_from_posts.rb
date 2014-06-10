class RemoveYoutubeIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :youtube_id    
  end

  def down
    add_column :posts, :youtube_id, :string
  end
end
