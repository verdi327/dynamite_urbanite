class TopIndustry < ActiveRecord::Base
  attr_accessible :city_id, :name
  belongs_to :city
end
