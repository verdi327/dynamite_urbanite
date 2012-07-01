namespace :custom do

  desc "Pulls in the demographic info for a city"
  task :people_facts => :environment do
    PeopleFact.destroy_all
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        facts = ZillowApi::People.find_by_city({city: city.name, state: city.state}, ZWSID2)
          PeopleFact.create(  single_males:         facts.single_males,
                              single_females:       facts.single_females,
                              median_age:           facts.median_age,
                              average_commute_time: facts.average_commute_time,
                              home_value:           facts.home_value,
                              city_id:              city.id )
      rescue Exception => e
        if e
          PeopleFact.create(  single_males:         "N/A",
                              single_females:       "N/A",
                              median_age:           "N/A",
                              average_commute_time: "N/A",
                              home_value:           "N/A",
                              city_id:              city.id )
        end
      end
      puts "successfully created facts for the people of #{city.name}"
    end
  end
end

