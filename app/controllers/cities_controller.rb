class CitiesController < ApplicationController
#test comment
#test comment
  def index
    #for elastic search
    # @cities = City.search(params) if params[:query]
    # @cities ||= nil
    #Using ILIKE locally will break(for pg), remove I to play nice with Sqlite
    if params[:query]
      @cities = City.where("name ILIKE ? OR state ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end

  def show
    @background_image = BackgroundPhoto.random
    @city = City.find_by_name(params[:id])
    @national_info = NationalFact.first
    @weather = WeatherApi::TodaysWeather.current_weather(@city.full_name)
    @photos = @city.instagram_photos.only_valid_photos.page(params[:page])
  end
end
