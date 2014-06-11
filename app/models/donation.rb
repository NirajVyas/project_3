class Donation < ActiveRecord::Base
  attr_accessible :amount, :body, :picture, :title, :video
end
