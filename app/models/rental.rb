class Rental < ApplicationRecord
  belongs_to :user_id
  belongs_to :artwork_id
end
