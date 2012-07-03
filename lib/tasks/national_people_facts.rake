namespace :custom do

  desc "Pulls in national demographic, but uses a city to make the api call"
  task :national_people_facts => :environment do
    NationalFact.destroy_all
    city = City.first
    begin
      puts "looking up #{city.name}"
      facts = ZillowApi::National.find_by_city({city: city.name, state: city.state}, ZWSID1)
        NationalFact.create(single_males:         facts.single_males,
                            single_females:       facts.single_females,
                            median_age:           facts.median_age,
                            average_commute_time: facts.average_commute_time,
                            home_value:           facts.home_value,
                            city_id:              city.id )
    rescue Exception => e
      if e
        NationalFact.create(single_males:         "N/A",
                            single_females:       "N/A",
                            median_age:           "N/A",
                            average_commute_time: "N/A",
                            home_value:           "N/A",
                            city_id:              city.id )
      end
    end
    puts "successfully created national facts using #{city.name} as a lookup"
  end
end