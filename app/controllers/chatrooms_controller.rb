class ChatroomsController < ApplicationController

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @chatroom = Chatroom.new(plant: @plant, user: current_user)

    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to plant_path(@plant)
    end
  end
end
