class Booking < ApplicationRecord
  belongs_to :dress
  belongs_to :user
  validates :start_date, :end_date, :confirmed, presence: true
end
