class FavouritesController < ApplicationController


  def create
    @plant = params[:plant_id]
    @user = params[:user_id]
    @favourite = Favourite.new(user_id: @user, plant_id: @plant)
    if @favourite.save
      redirect_to request.referrer, notice: "Plant added as favourite"
    end

  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to request.referrer, notice: "Plant removed from favourites"
    # redirect_to @favourite, notice: 'The plant is no longer in favorites'
  end


end
