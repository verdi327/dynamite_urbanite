class AddCityIdCurrentWeather < ActiveRecord::Migration
  def change
    add_column :current_weathers, :city_id, :integer
  end
end
