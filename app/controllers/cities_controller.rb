class CitiesController < ApplicationController
  def index
    @cities = City.search(params)
  end

  def show
    @city = City.find(params[:id])
    @current_weather = WeatherApi::TodaysWeather.current_weather(@city.full_name)
    @people_info = ZillowApi::People.find_by_city({city: @city.name, state: @city.state})
    @national_info = ZillowApi::National.find_by_city({city: @city.name, state: @city.state})
    @industry = CityData::CityIndustries.find_by_city({city: @city.name, state: @city.state})
    # client = Foursquare2::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET )
    # @rec_places = client.explore_venues(ll: "#{@city.latitude},#{@city.longitude}", radius: '8000')
    # @instagram_photos = Instagram.media_search(@city.short_lat, @city.short_lng, {count: 18})
    @deals = LivingSocialApi::DailyDealBuilder.build_for_city(@city.name)
    @walkscore = WalkscoreApi::Walkscore.find({lat: @city.latitude, long: @city.longitude})
  end

  def new
    @city = City.new
  end

  def edit
    @city = City.find(params[:id])
  end

  def create
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render json: @city, status: :created, location: @city }
      else
        format.html { render action: "new" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @city = City.find(params[:id])

    respond_to do |format|
      if @city.update_attributes(params[:city])
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html { redirect_to cities_url }
      format.json { head :no_content }
    end
  end
end
