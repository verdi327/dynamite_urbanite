class PeopleFact < ActiveRecord::Base
  attr_accessible :average_commute_time, :city_id, :home_value, :median_age, :single_females, :single_males
  belongs_to :city
end
