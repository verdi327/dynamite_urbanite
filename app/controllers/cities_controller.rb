class CitiesController < ApplicationController
  def index
    #for elastic search
    # @cities = City.search(params) if params[:query]
    # @cities ||= nil
    @cities = City.where("name OR state LIKE ?", params[:query])
  end

  def show
    @background_image = BackgroundPhoto.random
    @city = City.find_by_name(params[:id])
    @national_info = NationalFact.first
    @weather = WeatherApi::TodaysWeather.current_weather(@city.full_name)
    @photos = @city.instagram_photos.only_valid_photos.page(params[:page])
  end
end
