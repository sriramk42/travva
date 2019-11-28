require 'active_support/core_ext'
gem 'countries', require: 'countries/global'

class TripsController < ApplicationController

  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
    @past_trips = @trips.past
    @future_trips = @trips.future
    @current_trips = @trips.current
    @target_tab = params[:target_tab] || 'current'
  end

  def show
    @items = current_user.items.where(country: @trip.destination)
    @query = {model_name: "query"}
    if params[:query].present?
      # @items = current_user.items.where("country ILIKE ?", "%#{params[:query][:location]}%") if params[:query][:location]
      @category = params[:query][:category]
      @items = @items.where("category ILIKE ?", "%#{@category}%")
    end

    @dates = (@trip.start_date..@trip.end_date).to_a

    @search = {model_name: "search"}
    if params[:search] && params[:search][:date].present?
      @date = params[:search][:date]
      @trip_items = current_user.trip_items.where(date: Date.parse(params[:search][:date]))
      if @trip_items.empty?
        flash[:alert] = "No items found for selected date."
      end
    else
      @trip_items = @trip.trip_items
    end

    @markers = @trip_items.map do |trip_item|
      {
        lat: trip_item.item.latitude,
        lng: trip_item.item.longitude
      }
    end
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    # raise
    # @trip.remote_photo_url = "https://source.unsplash.com/?#{@trip.name}"
    authorize @trip
    @trip.user = current_user
    if @trip.save
      redirect_to "#{trips_path(target_tab: 'future')}"
    else
      render :new
    end
  end

  def edit
    c = ISO3166::Country.find_country_by_name(@trip.destination)
    @country_code = c.alpha2
  end

  def update

    if params[:new] && params[:old]   # coming from sortable, do not delete
      @trip.trip_items.each do |trip_item|
        if trip_item.order == params[:new].to_i
          trip_item.order = params[:old].to_i
          trip_item.save!
        elsif trip_item.order == params[:old].to_i
          trip_item.order = params[:new].to_i
          trip_item.save!
        end
      end
    end


    if @trip.attributes = trip_params
      @trip.save
      redirect_to trips_path(@trip)
    else
      render :edit
    end

  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  def review
    @trip = Trip.find(params[:trip_id])
    @trip_items = @trip.trip_items
    @dates = (@trip.start_date..@trip.end_date).to_a
    authorize @trip

    @date_trip_hash = Hash.new
    @dates.each do |tdate|
      @date_trip_hash[tdate] = Array.new
      @date_trip_hash[tdate] << @trip_items.select do |trip_item|
        trip_item.date.to_date == tdate
      end
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :user_id, :destination, :new, :old)
  end
end
