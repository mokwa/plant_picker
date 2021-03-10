class Chatroom < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  has_many :messages

  def owner
    plant.user
  end

  def client
    user
  end

  def other_person(current_user)
    if client == current_user
      return owner
    else
      return client
    end
  end
end
