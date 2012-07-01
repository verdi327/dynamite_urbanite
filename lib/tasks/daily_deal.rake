namespace :custom do

  desc "Pulls in daily deals for a city"
  task :daily_deals => :environment do
    DailyDeal.destroy_all
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        deals = Livingsocial2Api::DailyDeal.deal_for(city.name)
        puts "found #{deals.count} deals"
        deals.each do |deal|
          DailyDeal.create( image_url:      deal.image_url,
                            url:            deal.url,
                            original_price: deal.original_price,
                            deal_price:     deal.deal_price,
                            title:          deal.title,
                            description:    deal.description,
                            city_id:        city.id )
        end
      rescue Exception => e
        if e
          DailyDeal.create( image_url:      "N/A",
                            url:            "N/A",
                            original_price: "N/A",
                            deal_price:     "N/A",
                            title:          "N/A",
                            description:    "N/A",
                            city_id:        city.id )
        end
      end
      puts "successfully created daily deals for #{city.name}"
    end
  end
end