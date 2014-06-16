class City < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude
  geocoded_by :city
  after_validation :geocode
end
