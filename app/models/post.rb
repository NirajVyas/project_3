class Post < ActiveRecord::Base
  belongs_to :blog
  attr_accessible :body, :date, :location, :stayed, :tags, :title
end
