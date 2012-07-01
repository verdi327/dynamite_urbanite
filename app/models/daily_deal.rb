class DailyDeal < ActiveRecord::Base
  attr_accessible :city_id, :deal_price, :description, :image_url, :title, :url, :original_price
  belongs_to :city
end
