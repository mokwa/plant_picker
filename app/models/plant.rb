class Plant < ApplicationRecord
  belongs_to :type
  belongs_to :species
  belongs_to :user
end
