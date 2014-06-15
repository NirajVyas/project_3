class AddBlogPhotoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :blog_photo, :string
  end
end
