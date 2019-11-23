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
    @items = Item.all
    @query = {model_name: "query"}
    if params[:query].present?
      @location = params[:query][:location]
      @category = params[:query][:category]
      @items = Item.where("country ILIKE ? AND category ILIKE ?", "%#{@country}%", "%#{@category}%")
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
