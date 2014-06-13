class AddFieldsToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :comments, :boolean
    add_column :blogs, :public, :boolean
  end
end
