namespace :custom do

  desc "Pulls in tweets for a city"
  task :twitter => :environment do
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