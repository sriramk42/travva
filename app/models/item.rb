class Item < ApplicationRecord
  belongs_to :user
  has_many :trip_items, dependent: :destroy
  validates :title, presence: true
  validates :country, presence: true
  # validates :price, numericality: { only_float: true }
  mount_uploader :photo, PhotoUploader
  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :set_country_name, if: :will_save_change_to_country?

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode


  # CATEGORY = Item.select(:category).map(&:category).uniq.reject(&:blank?).map(&:capitalize)
  CATEGORY = ['Sport', 'Sightseeing', 'Food', 'Music', 'Museum', 'Relax and Rejuvenate', 'Shopping', 'Culture', 'Religion']
  COUNTRY = Item.select(:country).map(&:country).uniq.reject(&:blank?).map(&:capitalize)
  TIME_OF_DAY = ["Day", "Night"]
  WEATHER = ["Outdoor", "Indoor"]

  private

  def set_country_name
    country_code = ISO3166::Country[country]
    country_name = country_code.translations[I18n.locale.to_s] || country_code.name
    self.country = country_name
  end
end

