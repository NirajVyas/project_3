class User < ActiveRecord::Base
  acts_as_marker
  markable_as :favorite

  mount_uploader :profile_image, ProfileImageUploader


  has_many :blogs
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :display_name, :bio, :public, :profile_image
  # attr_accessible :title, :body
end
  
