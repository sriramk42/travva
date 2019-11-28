class TripItem < ApplicationRecord
  belongs_to :trip
  belongs_to :item
  validates_uniqueness_of :trip, scope: [:date, :item]
  before_create :assign_order_number
  before_destroy :delete_order_number

  def assign_order_number
    if trip.trip_items.where(date: date).any?
      self.order = trip.trip_items.where(date: date).order(order: :asc).last.order + 1
    else
      self.order = 1
    end
  end

  def delete_order_number
  # if trip.trip_items.count >= 2
    stuff = trip.trip_items.where(date: date).select do |titem|
        if titem.order
          titem.order > self.order
        end
      end
      # raise
    stuff.each do |sloth|
      sloth.order -= 1
      sloth.save!
    # end
    end
  end
end
