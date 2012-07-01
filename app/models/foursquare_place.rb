class FoursquarePlace < ActiveRecord::Base
  attr_accessible :city_id, :icon, :venue_name
  belongs_to :city
end
