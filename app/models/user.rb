class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader

  has_many :items, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :trip_items, through: :items
  has_many :trip_items, through: :trips #is this correct? needs to be verified
end
