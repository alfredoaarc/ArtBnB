class Artwork < ApplicationRecord
  belongs_to :owner_id

  validates :location, :price, :category, :description, :title, presence: true
end
