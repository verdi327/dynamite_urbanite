namespace :custom do

  desc "Pulls in top flickr photos for a city"
  task :flickr_photos => :environment do

    City.all.each do |city|
      puts 'setting up flickr variables'
      FlickRaw.api_key = FLICKR_API_KEY
      FlickRaw.shared_secret = FLICKR_SHARED_SECRET
      radius = 0.25
      args = {}
      args[:bbox] = "#{city.longitude - radius},#{city.latitude - radius},#{city.longitude + radius},#{city.latitude + radius}"
      args[:min_taken_date] = '2011-01-01 00:00:00'
      args[:max_taken_date] = '2012-01-01 00:00:00'
      args[:accuracy] = 1
      puts 'set flickr variables successfully'
      begin
        puts "looking up #{city.name}"
        photos = flickr.photos.search args
        photos.each do |photo|
          InstagramPhoto.create(  image:      FlickRaw.url(photo),
                                  city_id:    city.id )
        end
      rescue Exception => e
        if e
          InstagramPhoto.create(  image:       "N/A",
                                  city_id:    city.id )
        end
      end
      sleep 2
      puts "successfully created flickr photo for #{city.name}"
    end
  end
end

