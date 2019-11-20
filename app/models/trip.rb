class Trip < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :trip_items, dependent: :destroy
end
