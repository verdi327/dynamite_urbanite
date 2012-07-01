class CreateDailyDeals < ActiveRecord::Migration
  def change
    create_table :daily_deals do |t|
      t.integer :city_id
      t.string  :image_url
      t.string  :url
      t.string  :description
      t.string  :title
      t.integer :original_price
      t.integer :deal_price

      t.timestamps
    end
  end
end
