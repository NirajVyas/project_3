class Blog < ActiveRecord::Base
  markable_as :favorite
  has_many :posts
  belongs_to :user
  mount_uploader :blog_photo, BlogPhotoUploader
  mount_uploader :blog_image, BlogImageUploader

  acts_as_taggable

  attr_accessible :date, :description, :title, :user_id, :comments, :public, :blog_photo, :blog_image, :tag_list
end

