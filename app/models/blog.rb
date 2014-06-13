class Blog < ActiveRecord::Base
  markable_as :favorite
  has_many :posts
  belongs_to :user
  attr_accessible :date, :description, :title, :user_id, :comments, :public
end
