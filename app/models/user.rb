class User < ActiveRecord::Base
  acts_as_marker
  markable_as :favorite

  def role?(role)
      self.role.to_s == role.to_s
    end

devise :omniauthable


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
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :display_name, :bio, :public, :profile_image, :city, :latitude, :longitude, :display, :public_bio, :provider, :uid
  # attr_accessible :title, :body

  def favourites
    favorite_blogs.map(&:user).uniq
  end

  def forem_name
    name
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end    
    end
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.uid + "@twitter.com").first
      if registered_user
        return registered_user
      else

        user = User.create(name:auth.extra.raw_info.name,
                            # provider:auth.provider,
                            uid:auth.uid,
                            email:auth.uid+"@twitter.com",
                            password:Devise.friendly_token[0,20],
                          )
      end
    end
  end

end
  
