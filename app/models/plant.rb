class Plant < ApplicationRecord
  belongs_to :type
  belongs_to :user
  has_many :chatrooms
  has_many :transitions
  has_many :favourites
  has_many :reviews, through: :transitions
  validates :name, presence: true
  validates :description, presence: true
  validates :status, inclusion: { in: %w(available promised traded), message: "%{value} is not a valid status" }
  has_many_attached :photos
end
