class Post < ActiveRecord::Base
  attr_accessible :body, :date, :location, :stayed, :tags, :title
end
