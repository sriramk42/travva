class TripItem < ApplicationRecord
  belongs_to :trip
  belongs_to :item
  validates_uniqueness_of :trip_id, scope: :date
end
