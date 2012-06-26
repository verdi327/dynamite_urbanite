class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.integer :population
      t.float :longitude
      t.float :latitude
      t.string :display_photo

      t.timestamps
    end
  end
end
