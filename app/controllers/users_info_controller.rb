class UsersInfoController < ApplicationController
  def index
    @plants = Plant.all
    @transitions = Transition.all
  end
end
