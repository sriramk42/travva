class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.geocoded
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
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :url, :address, :time_of_day, :weather, :category, :price, :country, :city, :rating, :user_id, :photo)
  end

  def search_params
    params.require(:search).permit(country:[], category:[])
  end
end
