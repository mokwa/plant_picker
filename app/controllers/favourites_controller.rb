class FavouritesController < ApplicationController


  def create
    @plant = Plant.find(params[:plant_id])
    @user = current_user
    @favourite = Favourite.new(user: @user, plant: @plant)
    if @favourite.save
      redirect_to request.referrer, notice: "Plant added as favourite"
    end

  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to request.referrer, notice: "Plant removed from favourites"
    
  end


end
