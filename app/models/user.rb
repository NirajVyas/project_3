class User < ActiveRecord::Base
  acts_as_marker
  markable_as :favorite

  mount_uploader :profile_image, ProfileImageUploader

  geocoded_by :city
  # after_validation :geocode, :if => :address_changed?
  has_many :city
  
  
  has_many :blogs
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :display_name, :bio, :public, :profile_image, :city, :latitude, :longitude, :display, :public_bio
  # attr_accessible :title, :body

  def favourites
    favorite_blogs.map(&:user).uniq
  end

  def forem_name
    name
  end

end
  
