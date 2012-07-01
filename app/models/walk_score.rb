class WalkScore < ActiveRecord::Base
  attr_accessible :city_id, :description, :last_updated, :logo_url, :score, :ws_link
  belongs_to :city
end
