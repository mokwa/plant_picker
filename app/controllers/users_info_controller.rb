class UsersInfoController < ApplicationController
  def index
    @plants = Plant.all
    @transitions = Transition.all
    @favourites = Favourite.all
  end
end
