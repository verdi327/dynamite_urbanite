require 'csv'

namespace :custom do

  # controller name
  desc "Loads 50 Wallpaper sized background photos"
  task :background_photos => :environment do
    BackgroundPhoto.destroy_all
    start_time = Time.now
    filename = File.join(Rails.root, '/public/csv/background_photos.csv')
    failures = []

    CSV.foreach(filename) do |row|
      begin
        # model name
        BackgroundPhoto.create!( :image => row[0] )

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