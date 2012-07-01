class City < ActiveRecord::Base
  attr_accessible :display_photo, :latitude, :longitude, :name, :population, :state
  attr_accessible :display_photo
  has_many :foursquare_places
  has_many :instagram_photos
  has_one :walk_score
  has_many :top_industries
  has_many :people_facts
  has_many :people_types
  has_many :transportation_types
  has_many :daily_deals
  has_many :current_weathers

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

  def short_lat
    self.latitude.to_s[0..4]
  end

  def short_lng
    self.longitude.to_s[0..5]
  end

  def no_photos
    self.instagram_photos.first.image == "N/A"
  end

  def only_valid_photos
    self.instagram_photos.where("image != ?", "N/A")
  end

end
