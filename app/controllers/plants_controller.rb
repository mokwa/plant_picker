class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_plant, only: [:show, :edit, :update, :destroy]

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
    @chatroom = Chatroom.find_by(plant: @plant, user: current_user)
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
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

private

  def plant_params
    params.require(:plant).permit(:name, :description, :status, :type_id, photos: [])
  end

  def find_plant
    @plant = Plant.find(params[:id])
  end
end
