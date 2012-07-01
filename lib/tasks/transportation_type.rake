namespace :custom do

  desc "Pulls in the modes of transportation of people for a city"
  task :transportation_types => :environment do
    TransportationType.destroy_all
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        response = ZillowApi::People.mode_of_transit({city: city.name, state: city.state}, ZWSID3)
        response['transportation'].each do |description|
            TransportationType.create( city_id: city.id,
                                       description: description )
        end
      rescue Exception => e
        if e
          TransportationType.create(  city_id: city.id,
                                      description: "N/A" )
        end
      end
      puts "successfully created transportation types for the people of #{city.name}"
    end
  end
end