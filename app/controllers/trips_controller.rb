class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
    @past_trips = @trips.past
    @future_trips = @trips.future
    @current_trips = @trips.current
  end

  def show
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
      redirect_to trip_path(@trip)
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
