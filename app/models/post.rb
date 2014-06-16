class Post < ActiveRecord::Base
  belongs_to :blog
  has_one :video

  has_many :images

  acts_as_commentable
  attr_accessible :body, :date, :location, :stayed, :tags, :title, :photo_uploader, :video_attributes, :latitude, :longitude, :blog_photo
  mount_uploader :photo_uploader, PhotoUploaderUploader
  geocoded_by :location
  after_validation :geocode
  accepts_nested_attributes_for :video


  def create_images(params_images)

    params_images.each do |image|
      images.create(photo_file: image.tempfile)
    end
  end

end
