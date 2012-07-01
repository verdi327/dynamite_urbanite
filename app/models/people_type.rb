class PeopleType < ActiveRecord::Base
  attr_accessible :city_id, :description, :name
  belongs_to :city
end
