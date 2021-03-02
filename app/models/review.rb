class Review < ApplicationRecord
  belongs_to :transition
  validates :rating, presence: true
end
