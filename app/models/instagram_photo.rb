class InstagramPhoto < ActiveRecord::Base
  attr_accessible :city_id, :image
  belongs_to :city

  paginates_per 16

  def self.only_valid_photos
    where("image != ?", "N/A")
  end


end
