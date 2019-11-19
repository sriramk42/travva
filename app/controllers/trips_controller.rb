class TripsController < ApplicationController
  before_action :set_trip, only: [:show]

  def index
    @trip = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
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
  end

  def set_params
    params.require(:trip).permit(:name, :start_date, :end_date, :user_id, :destination)
  end
end
