class UsersInfoController < ApplicationController
  def index
    @plants = Plant.all
    @transitions = Transition.all
    @chatrooms = Chatroom.all
    @messages = Message.all
  end
end
