namespace :custom do

  desc "Pulls in top industries for a city"
  task :top_industries => :environment do
    TopIndustry.destroy_all
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        industries = CityData::CityIndustries.find_by_city({city: city.name, state: city.state})
        industries.most_common.each do |industry|
          TopIndustry.create(  name:    industry,
                               city_id: city.id )
        end
      rescue Exception => e
        if e
          TopIndustry.create( name:       "N/A",
                              city_id:    city.id )
        end
      end
      puts "successfully created top industries for #{city.name}"
    end
  end
end
