class CreateFoursquarePlaces < ActiveRecord::Migration
  def change
    create_table :foursquare_places do |t|
      t.string :icon
      t.string :venue_name
      t.integer :city_id

      t.timestamps
    end
  end
end
