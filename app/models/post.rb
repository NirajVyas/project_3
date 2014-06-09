class Post < ActiveRecord::Base
  belongs_to :blog
  has_one :video
  attr_accessible :body, :date, :location, :stayed, :tags, :title, :photo_uploader, :video_attributes
  mount_uploader :photo_uploader, PhotoUploaderUploader

  accepts_nested_attributes_for :video
end
