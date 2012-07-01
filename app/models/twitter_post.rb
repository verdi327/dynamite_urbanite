class TwitterPost < ActiveRecord::Base
  attr_accessible :city_id, :tweet, :tweeted_by
  belongs_to :city

end
