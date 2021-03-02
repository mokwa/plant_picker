class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_plant, only: [:show, :edit, :update, :destroy]

  def index
    @plants = Plant.all
  end

  def show; end

  def new
    # @species = Species.find(params[:species_id])
    # @type = Type.find(params[:type_id])
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)

    @species = Species.find(params[:species_id])
    @type = Type.find(params[:type_id])

    @plant.species = @species
    @plant.type = @type


    @plant.user = current_user

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
    params.require(:plant).permit(:name, :description, :status)
  end

  def find_plant
    @plant = Plant.find(params[:id])
  end
end
