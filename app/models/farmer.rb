class Farmer < ActiveRecord::Base
  attr_accessible :email, :farm, :name, :password_hash, :produce, :produce_price, :wepay_access_token, :wepay_account_id
end
