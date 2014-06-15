class Post < ActiveRecord::Base
  belongs_to :blog
  has_one :video
  has_many :comments

  acts_as_commentable
  attr_accessible :body, :date, :location, :stayed, :tags, :title, :photo_uploader, :video_attributes, :latitude, :longitude
  mount_uploader :photo_uploader, PhotoUploaderUploader
  geocoded_by :location
  accepts_nested_attributes_for :video
end
