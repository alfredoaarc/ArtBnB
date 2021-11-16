class Artwork < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :location, :price, :category, :description, :title, presence: true
end
