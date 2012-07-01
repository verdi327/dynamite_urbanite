class CurrentWeather < ActiveRecord::Base
  attr_accessible :condition, :humidity, :icon, :temperature, :wind_condition, :city_id
  belongs_to :city
end
