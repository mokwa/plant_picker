class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_plant, only: [:show, :edit, :update, :destroy]

  def index
    @plants = Plant.all
  end

  def show; end

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
