class Artwork < ApplicationRecord
  belongs_to :user
  validates :location, :price, :category, :description, :title, presence: true
end
