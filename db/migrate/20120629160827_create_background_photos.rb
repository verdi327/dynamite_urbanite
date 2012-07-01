class CreateBackgroundPhotos < ActiveRecord::Migration
  def change
    create_table :background_photos do |t|
      t.string :image

      t.timestamps
    end
  end
end
