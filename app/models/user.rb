require 'uri'

class User < ApplicationRecord
  has_many :artworks, dependent: :destroy
  has_many :rentals, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
