class TransitionsController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @plant = @chatroom.plant
    @transition = Transition.create(user: @chatroom.user, plant: @plant)
    @plant.update(status: "promised")
    redirect_to chatroom_path(@chatroom)
  end
end
