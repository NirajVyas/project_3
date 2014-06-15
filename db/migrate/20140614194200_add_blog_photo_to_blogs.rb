class AddBlogPhotoToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :blog_photo, :string
  end
end
