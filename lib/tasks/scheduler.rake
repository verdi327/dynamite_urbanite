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


namespace :custom do

  desc "Pulls in tweets for a city"
  task :twitter => :environment do
    Twitter.configure do |config|
      config.consumer_key = TWITTER_CONSUMER_KEY
      config.consumer_secret = TWITTER_CONSUMER_SECRET
    end
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        city_without_dash = city.name.gsub("-", " ")
        love_tweets = Twitter.search("I love #{city_without_dash}", rpp: 10).map {|tweet| user = tweet.from_user, tweet = tweet.text}.uniq
        hate_tweets = Twitter.search("I hate #{city_without_dash}", rpp: 10).map {|tweet| user = tweet.from_user, tweet = tweet.text}.uniq
        all_tweets = love_tweets + hate_tweets
        all_tweets.each do |tweet|
          TwitterPost.create( tweeted_by: tweet[0],
                              tweet:      tweet[1],
                              city_id:    city.id )
        end
      rescue Exception => e
        if e
          TwitterPost.create( tweeted_by: "N/A",
                              tweet:      "N/A",
                              city_id:    city.id )
        end
      end
      sleep 1
      puts "successfully created tweets for #{city.name}"
    end
  end
end

namespace :custom do

  desc "Pulls in top instagrams photos for a city"
  task :instagram_photos => :environment do
    Instagram.configure do |config|
      config.client_id     = INSTAGRAM_CLIENT_ID
      config.client_secret = INSTAGRAM_CLIENT_SECRET
    end
    City.all.each do |city|
      begin
        puts "looking up #{city.name}"
        puts "this is where you find the city at #{city.short_lat} - #{city.short_lng}"
        photos = Instagram.media_search(city.short_lat, city.short_lng)
        photos.data.each do |photo|
          InstagramPhoto.create(  image:      photo.images.standard_resolution.url,
                                  city_id:    city.id )
        end
      rescue Exception => e
        if e
          InstagramPhoto.create(  image:       "N/A",
                                  city_id:    city.id )
        end
      end
      sleep 1
      puts "successfully created instagram photo for #{city.name}"
    end
  end
end