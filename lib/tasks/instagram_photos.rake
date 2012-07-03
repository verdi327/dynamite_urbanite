namespace :custom do

  desc "Pulls in top instagrams photos for a city"
  task :instagram_photos => :environment do
    Instagram.configure do |config|
      config.client_id     = INSTAGRAM_CLIENT_ID
      config.client_secret = INSTAGRAM_CLIENT_SECRET
    end
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        puts "this is where you find the city at #{city.short_lat} - #{city.short_lng}"
        photos = Instagram.media_search(city.short_lat, city.short_lng)
        photos.data.each do |photo|
          InstagramPhoto.create(  image:      photo.images.standard_resolution.url,
                                  city_id:    city.id )
        end
      rescue Exception => e
        if e
          InstagramPhoto.create(  image:       "N/A",
                                  city_id:    city.id )
        end
      end
      sleep 5
      puts "successfully created instagram photo for #{city.name}"
    end
  end
end

