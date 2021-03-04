class Chatroom < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  validates :name, presence: true
  has_many :messages
end
