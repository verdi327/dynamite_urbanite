class CreateNationalDeals < ActiveRecord::Migration
  def change
    create_table :national_deals do |t|
      t.string :image_url
      t.string :url
      t.string :description
      t.integer :original_price
      t.integer :deal_price
      t.string :title

      t.timestamps
    end
  end
end
