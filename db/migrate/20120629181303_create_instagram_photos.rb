class CreateInstagramPhotos < ActiveRecord::Migration
  def change
    create_table :instagram_photos do |t|
      t.string :image
      t.integer :city_id

      t.timestamps
    end
  end
end
