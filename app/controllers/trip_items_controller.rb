class TripItemsController < ApplicationController
  def create
    if params[:date]
      @trip_item.date = params[:date]
              redirect_to trip_path(@trip_item.trip_id)

    end

    @trip_item = TripItem.new
    @trip_item.trip_id = params[:trip_id]
    @item_id = params[:item]
    @trip_item.item_id = @item_id

    if params[:date]
      @trip_item.date = params[:date]
    end

    authorize @trip_item
    raise
    if @trip_item.save
      if params[:date]
        redirect_to trip_path(@trip_item.trip_id)
      end
      flash.now[:notice] = 'Item correctly added to your trip'
    else
      flash.now[:alert] = 'You have already added this item to your trip'
    end
  end

  def destroy
    # To be filled
  end
end
