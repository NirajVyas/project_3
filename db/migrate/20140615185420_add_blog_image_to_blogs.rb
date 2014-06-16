class AddBlogImageToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :blog_image, :string
  end
end
