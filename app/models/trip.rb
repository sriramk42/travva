class Trip < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :trip_items, dependent: :destroy
  scope :past, -> { where('end_date < ?', Date.today) }
  scope :future, -> { where('start_date > ?', Date.today) }
  scope :current, -> { where('? BETWEEN start_date AND end_date', Date.today) }

  after_validation :set_country_name, if: :will_save_change_to_name?
  after_validation :set_photo

  private

  def set_country_name
    country_code = ISO3166::Country[destination]
    country_name = country_code.translations[I18n.locale.to_s] || country_code.name
    self.destination = country_name
  end

  def set_photo
    self.remote_photo_url = "https://source.unsplash.com/1600x900/?#{self.destination}"
  end
end
