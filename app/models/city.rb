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
  has_many :twitter_posts

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

  def no_valid_photos
    true if self.instagram_photos.where("image != ?", "N/A").size == 0
  end

  def only_valid_photos
    self.instagram_photos.where("image != ?", "N/A").shuffle
  end

  def love_tweets
    self.twitter_posts.select {|post| post.tweet.include?('love')}
  end

  def hate_tweets
    self.twitter_posts.select {|post| post.tweet.include?('hate')}
  end

end
