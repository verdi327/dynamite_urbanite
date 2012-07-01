class NationalDeal < ActiveRecord::Base
  attr_accessible :deal_price, :description, :image_url, :original_price, :title, :url
end
