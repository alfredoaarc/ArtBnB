class Artwork < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :location, :price, :category, :description, :title, presence: true
  has_many :rentals

  include PgSearch::Model
  pg_search_scope :search_by_category,
    against: [ :category ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_location,
  against: [ :location ],
  using: {
    tsearch: { prefix: true }
  }
end
