  class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :from_type]
  before_action :find_plant, only: [:show, :edit, :update, :destroy, :status_update]

  def index
    #getting all users
    @users = User.all
    @plants = Plant.all
    @types = Type.all

    #getting the latitude and longitude for each user
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('map_icon.png')
      }
    end
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find_by(plant: @plant, user: current_user)
    #if the user is logged in
    if current_user.present? && @plant.user != current_user
      @favourite = Favourite.find_by(user_id: current_user.id, plant_id: @plant.id)
    end
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    @plant.status = "available"

    if @plant.save
      redirect_to plant_path(@plant), notice: "Plant added"
    else
      render :new
    end
  end

  def edit; end

  def update
    @plant.update!(plant_params)
    redirect_to plant_path(@plant)
  end

  def status_update
    @plant.update!(status: "traded")
    redirect_to request.referrer
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  def from_type
    @plants = Plant.joins(:type).where(type_id: params[:type_id])
    respond_to do |format|
      format.js
    end
  end

private

  def plant_params
    params.require(:plant).permit(:name, :description, :status, :type_id, photos: [])
  end

  def find_plant
    @plant = Plant.find(params[:id])
  end
end
