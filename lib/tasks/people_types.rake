namespace :custom do

  desc "Pulls in the categories of the type of people for a city"
  task :people_types => :environment do
    PeopleType.destroy_all
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        types = ZillowApi::People.lives_here_attributes({city: city.name, state: city.state}, ZWSID3)
        types['lives here'].each do |name, description|
            PeopleType.create( city_id: city.id,
                               name: name,
                               description: description )
        end
      rescue Exception => e
        if e
          PeopleType.create(  city_id: city.id,
                              name: "N/A",
                              description: "N/A" )
        end
      end
      puts "successfully created categories for the people of #{city.name}"
    end
  end
end
