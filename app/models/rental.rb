class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :start_time, :end_time, presence: true

  def total_days
    (end_time - start_time).to_i
  end

  def total_price
    total_days * artwork.price
  end
end
