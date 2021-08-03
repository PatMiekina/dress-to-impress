class Dress < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :title, :size, presence: true
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
