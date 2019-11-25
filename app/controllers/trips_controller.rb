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
    @items = current_user.items
    @query = {model_name: "query"}
    if params[:query].present?
      @location = params[:query][:location]
      @category = params[:query][:category]
      @items = Item.where("country ILIKE ? AND category ILIKE ?", "%#{@country}%", "%#{@category}%")
    end

    @dates = (@trip.start_date..@trip.end_date).to_a

    @search = {model_name: "search"}
    if params[:search].present?
      # @date = params[:search][:date]
      @trip_items = current_user.trip_items.where(date: Date.parse(params[:search][:date]))
      if @trip_items.empty?
        @trip_items = @trip.trip_items
        flash[:alert] = "No items found for selected date."
      end
    else
      @trip_items = @trip.trip_items
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
  end

  def update
  end

  def destroy
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :user_id, :destination)
  end
end
