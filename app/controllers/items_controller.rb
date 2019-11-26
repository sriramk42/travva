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
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def suggestions
    if params["search"]
      @city = params["search"]["city"]
    else
      @city = "Paris"
    end
    p ENV["API_ACCOUNT"]
    url = "https://www.triposo.com/api/20190906/location.json?tag_labels=city&annotate=trigram:#{@city}&trigram=>=0.3&count=10&account=VE4X2F8O&token=s7g0roq9ibxhev3tml0wej8w5ul4reon"
    response = RestClient.get url
    city_info = JSON.parse(response)
    city_id = city_info["results"][0]["id"]
    @city_name = city_info["results"][0]["name"]
    @city_snippet = city_info["results"][0]["snippet"]
    country = city_info["results"][0]["country_id"]

    url = "https://www.triposo.com/api/20190906/poi.json?location_id=#{city_id}&tag_labels=sightseeing&count=60&order_by=-score&account=VE4X2F8O&token=s7g0roq9ibxhev3tml0wej8w5ul4reon"
    response = RestClient.get url
    @repos = JSON.parse(response)

    @markers = @repos["results"].map do |repo|
      {
        lat: repo["coordinates"]["latitude"],
        lng: repo["coordinates"]["longitude"]
      }
    end

    @trips = Trip.future.where(destination: country)
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:title, :url, :address, :time_of_day, :weather, :category, :price, :country, :city, :rating, :user_id, :photo, :photo_cache)
  end

  def search_params
    params.require(:search).permit(country:[], category:[])
  end
end
