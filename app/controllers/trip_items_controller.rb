class TripItemsController < ApplicationController
  def create
    @trip_item = TripItem.new
    @trip_item.trip_id = params[:trip_id]
    @item_id = params[:item]
    @trip_item.item_id = @item_id

    if params[:date]
      @trip_item.date = Date.parse(params[:date])
    end

    authorize @trip_item
      if @trip_item.save
        flash.now[:notice] = 'Item correctly added to your trip'
      else
        flash.now[:alert] = 'You have already added this item'
      end
    end

  def destroy
    # To be filled
  end
end
