namespace :custom do
  desc "Pulls in top 30 Foursquare venues for a city"
  task :foursquare_places => :environment do
    FoursquarePlace.destroy_all
    @client = Foursquare2::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET )
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        rec_places = @client.explore_venues(ll: "#{city.latitude},#{city.longitude}", radius: '8000')
        rec_places.groups.first.items.each do |item|
          FoursquarePlace.create( icon:       item.venue.categories.first.icon,
                                  venue_name: item.venue.name,
                                  city_id:    city.id )
        end
      rescue Exception => e
        if e
          FoursquarePlace.create( icon:       "N/A",
                                  venue_name: "N/A",
                                  city_id:    city.id )
        end
      end
      sleep 2
      puts "successfully created foursquare_places for #{city.name}"
    end
  end
end


