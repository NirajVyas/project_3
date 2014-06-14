class Blog < ActiveRecord::Base
  markable_as :favorite
  has_many :posts
  belongs_to :user
  mount_uploader :blog_photo, BlogPhotoUploader
  attr_accessible :date, :description, :title, :user_id, :comments, :public, :blog_photo
end

