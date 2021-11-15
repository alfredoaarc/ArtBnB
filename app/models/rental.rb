class Rental < ApplicationRecord
  belongs_to :user_id
  belongs_to :artwork_id

  validates :start_time, :end_time, presence: true
end
