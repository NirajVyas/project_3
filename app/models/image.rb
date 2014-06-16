class Image < ActiveRecord::Base
  attr_accessible :post_id, :photo_file

  belongs_to :post
  mount_uploader :photo_file, BlogPhotoUploader

end
