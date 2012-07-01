class CitiesController < ApplicationController
  def index
    @cities = City.search(params)
  end

  def show
    @background_image = BackgroundPhoto.random
    @city = City.find(params[:id])
    @national_info = NationalFact.first
    @weather = WeatherApi::TodaysWeather.current_weather(@city.full_name)
  end
end
