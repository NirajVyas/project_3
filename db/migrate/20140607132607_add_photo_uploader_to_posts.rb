class AddPhotoUploaderToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :photo_uploader, :string
  end
end
