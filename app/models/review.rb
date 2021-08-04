class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dress
  validates :rating, :content, presence: true
  validates :rating, inclusion: { :in => 1..5 }
end
