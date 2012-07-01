class BackgroundPhoto < ActiveRecord::Base
  attr_accessible :image

  def self.random
    all.shuffle.first
  end
end
