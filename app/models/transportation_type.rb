class TransportationType < ActiveRecord::Base
  attr_accessible :description, :city_id
  belongs_to :city
end
