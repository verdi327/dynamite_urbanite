class City < ActiveRecord::Base
  attr_accessible :display_photo, :latitude, :longitude, :name, :population, :state
  attr_accessible :display_photo
  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query], default_operator: "AND" } if params[:query].present?
    end
  end

  def full_name
    "#{name}, #{state}"
  end

  def display_photo
    "http://" + self['display_photo']
  end

end
