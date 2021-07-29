class Booking < ApplicationRecord
  belongs_to :dress
  belongs_to :user
  belongs_to :user, through: :dress
  validates :start_date, :end_date, :confirmed, presence: true
end
