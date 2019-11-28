class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = policy_scope(Item).order(created_at: :desc)
    # @items = Item.geocoded
    @search = {model_name: "search"}
    if params[:search].present?
      @search = @search.merge(search_params.to_h)

      if params[:search][:category].uniq.reject(&:blank?).present?
        @items = @items.where(category: params[:search][:category])
      end
      if params[:search][:country].uniq.reject(&:blank?).present?
        @items = @items.where(country: params[:search][:country])
      end
    end

    @search = OpenStruct.new(@search)

    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
      }
    end

    @trips = Trip.future

    @countries = Item.select(:country).map(&:country).uniq.reject(&:blank?)
    @item_countries = @items.map(&:country).uniq.reject(&:blank?).sort
    # @items = @items.group(:country)
    # raise
  end

  def new
    @item = Item.new
    authorize @item
    # @countries = ISO3166::Country.all.map { |country| country.name }.sort
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    @item.user = current_user
    if @item.save
      path = URI(request.referer).path == suggestions_path ? suggestions_path : items_path
      redirect_to path
    else
      render :new
    end
  end

  def edit
    c = ISO3166::Country.find_country_by_name(@item.country)
    @country_code = c.alpha2
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  def suggestions
    if params["search"]
      @city = params["search"]["city"]
    else
      @city = "Paris"
    end
    url = "https://www.triposo.com/api/20190906/location.json?tag_labels=city&annotate=trigram:#{@city}&trigram=>=0.3&count=10&account=VE4X2F8O&token=s7g0roq9ibxhev3tml0wej8w5ul4reon"
    response = RestClient.get url
    city_info = JSON.parse(response)
    city_id = city_info["results"][0]["id"]
    @city_name = city_info["results"][0]["name"]
    @city_snippet = city_info["results"][0]["snippet"]
    countryid = city_info["results"][0]["country_id"]
    @category = "Sightseeing"

    country_code_url = "https://www.triposo.com/api/20190906/location.json?tag_labels=country&fields=name,country_id&account=VE4X2F8O&token=s7g0roq9ibxhev3tml0wej8w5ul4reon&count=100"
    countries_info = JSON.parse(RestClient.get country_code_url)
    country = countries_info["results"].select { |countryhash| countryhash["country_id"] == countryid }
    @country = country[0]["name"]
    c = ISO3166::Country.find_country_by_name(@country)
    @country_code = c.alpha2

    # country_code_url = "https://restcountries.eu/rest/v2/name/#{@country}?fullText=true"
    # country_info = JSON.parse(RestClient.get country_code_url)
    # @country_code = country_info[0]["alpha2Code"]

    url = "https://www.triposo.com/api/20190906/poi.json?location_id=#{city_id}&tag_labels=sightseeing&count=30&order_by=-score&account=VE4X2F8O&token=s7g0roq9ibxhev3tml0wej8w5ul4reon"
    response = RestClient.get url
    @repos = JSON.parse(response)

    @markers = @repos["results"].map do |repo|
      {
        lat: repo["coordinates"]["latitude"],
        lng: repo["coordinates"]["longitude"]
      }
    end

    # @trips = Trip.future.where(destination: country)
  end

  def suggestions_create
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:title, :url, :address, :time_of_day, :weather, :category, :price, :country, :city, :rating, :user_id, :photo, :photo_cache, :remote_photo_url, :latitude, :longitude)
  end

  def search_params
    params.require(:search).permit(country:[], category:[])
  end
end
