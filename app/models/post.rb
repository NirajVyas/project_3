class Post < ActiveRecord::Base
  belongs_to :blog
  attr_accessible :body, :date, :location, :stayed, :tags, :title, :photo_uploader, :youtube_id
  mount_uploader :photo_uploader, PhotoUploaderUploader
end
