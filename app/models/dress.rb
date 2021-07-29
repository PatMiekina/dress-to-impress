class Dress < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :title, :size, presence: true
end
