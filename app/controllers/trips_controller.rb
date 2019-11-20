class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
    @trip = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    authorize @trip
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

  def set_params
    params.require(:trip).permit(:name, :start_date, :end_date, :user_id, :destination)
  end
end
