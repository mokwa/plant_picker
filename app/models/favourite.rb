class Favourite < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  validates :plant_id, uniqueness: { scope: :user_id }
end
