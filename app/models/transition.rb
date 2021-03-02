class Transition < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  has_many :reviews
end
