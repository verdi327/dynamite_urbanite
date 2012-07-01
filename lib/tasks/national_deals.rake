namespace :custom do

  desc "Pulls in a list of national deals"
  task :national_deals => :environment do
    NationalDeal.destroy_all
    begin
      deals = Livingsocial2Api::NationalDeal.deal
      puts "found #{deals.count} deals"
      deals.each do |deal|
        NationalDeal.create(  image_url:      deal.image_url,
                              url:            deal.url,
                              original_price: deal.original_price,
                              deal_price:     deal.deal_price,
                              title:          deal.title,
                              description:    deal.description )
      end
    rescue Exception => e
      if e
        NationalDeal.create(  image_url:      "N/A",
                              url:            "N/A",
                              original_price: "N/A",
                              deal_price:     "N/A",
                              title:          "N/A",
                              description:    "N/A" )
      end
    end
    puts "successfully created all national deals"
  end
end