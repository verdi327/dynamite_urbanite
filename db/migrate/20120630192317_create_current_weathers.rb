class CreateCurrentWeathers < ActiveRecord::Migration
  def change
    create_table :current_weathers do |t|
      t.string :condition
      t.string :temperature
      t.string :humidity
      t.string :wind_condition
      t.string :icon

      t.timestamps
    end
  end
end
