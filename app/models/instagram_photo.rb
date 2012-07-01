class InstagramPhoto < ActiveRecord::Base
  attr_accessible :city_id, :image
  belongs_to :city
end
