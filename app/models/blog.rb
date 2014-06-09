class Blog < ActiveRecord::Base
  has_many :posts
  attr_accessible :date, :description, :title
end
