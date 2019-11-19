class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_items, dependent: :destroy
end
