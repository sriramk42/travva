class Item < ApplicationRecord
  belongs_to :user
  has_many :trip_items, dependent: :destroy
  validates :title, presence: true
  validates :country, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }
  validates :price, numericality: { only_float: true }
  mount_uploader :photo, PhotoUploader

  CATEGORY = Item.select(:category).map(&:category).uniq.reject(&:blank?)
  COUNTRY = Item.select(:category).map(&:category).uniq.reject(&:blank?)
end
