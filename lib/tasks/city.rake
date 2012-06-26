require 'csv'

namespace :custom do

  # controller name
  desc "Loads Top 100 Cities"
  task :cities => :environment do
    City.destroy_all
    start_time = Time.now
    filename = File.join(Rails.root, '/public/csv/top_100_city_seed.csv')
    failures = []

    CSV.foreach(filename, :headers => true) do |row|
      begin
        # model name
        City.create!( :name          => row[0],
                      :state         => row[1],
                      :population    => row[2],
                      :latitude      => row[3],
                      :longitude     => row[4],
                      :display_photo => row[5] )

      rescue Exception => e
        failures << row
      end
    end

    total_time = Time.now - start_time
    puts "Elapsed time #{total_time} seconds."
    puts "Failed to add #{failures.count} styles"
    puts failures.inspect
  end
end