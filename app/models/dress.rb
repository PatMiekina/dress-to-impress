class Dress < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :title, :size, presence: true
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
