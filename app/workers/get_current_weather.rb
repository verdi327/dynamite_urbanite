class GetCurrentWeather
  @queue = :current_weather_queue
  def self.perform(city_id)
    city = City.find(city_id)
    current_weather = WeatherApi::TodaysWeather.current_weather(city.full_name)
    CurrentWeather.create(condition:      current_weather.condition,
                          temperature:    current_weather.temperature,
                          wind_condition: current_weather.wind_condition,
                          icon:           "http://#{current_weather.icon}",
                          humidity:       current_weather.humidity,
                          city_id:        city.id)
  end
end
