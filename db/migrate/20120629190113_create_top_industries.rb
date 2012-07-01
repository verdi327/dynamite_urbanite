class CreateTopIndustries < ActiveRecord::Migration
  def change
    create_table :top_industries do |t|
      t.string :name
      t.integer :city_id

      t.timestamps
    end
  end
end
