class Item < ApplicationRecord
  belongs_to :user
  has_many :trip_items, dependent: :destroy
  validates :country, presence: true
  validates :title, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: {only_integer: true}
  validates :price, numericality: {only_float: true}
end
