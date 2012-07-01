namespace :custom do

  desc "Pulls in walkscore for a city"
  task :walk_score => :environment do
    WalkScore.destroy_all
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        walkscore = WalkscoreApi::Walkscore.find({lat: city.latitude, long: city.longitude})
        WalkScore.create(  score:        walkscore.score,
                           description:  walkscore.description,
                           last_updated: walkscore.updated,
                           logo_url:     walkscore.logo_url,
                           ws_link:      walkscore.ws_link,
                           city_id:      city.id )
      rescue Exception => e
        if e
          WalkScore.create(  score:        "N/A",
                             description:  "N/A",
                             last_updated: "N/A",
                             logo_url:     "N/A",
                             ws_link:      "N/A",
                             city_id:      city.id )
        end
      end
      sleep 2
      puts "successfully created walkscore for #{city.name}"
    end
  end
end
