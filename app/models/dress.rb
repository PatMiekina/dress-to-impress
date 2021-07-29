class Dress < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :title, :size, presence: true
  has_many :reviews, dependent: :destroy
end
