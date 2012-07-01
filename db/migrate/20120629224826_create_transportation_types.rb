class CreateTransportationTypes < ActiveRecord::Migration
  def change
    create_table :transportation_types do |t|
      t.string :description
      t.integer :city_id

      t.timestamps
    end
  end
end
