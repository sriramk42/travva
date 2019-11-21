class Trip < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :trip_items, dependent: :destroy
  scope :past, -> { where('end_date < ?', Date.today) }
  scope :future, -> { where('start_date > ?', Date.today) }
  scope :current, -> { where('? BETWEEN start_date AND end_date', Date.today) }
end
