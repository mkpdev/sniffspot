class SpotsController < ApplicationController
  include ActiveStorage::SetCurrent
  
  def index   
     @spots = Spot.all.order(:price)  
     render json: SpotBlueprint.render(@spots)   
  end

  def show
    @spot = Spot.find(params[:id])
    render json: SpotBlueprint.render(@spot), status: 200
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      render json: SpotBlueprint.render(@spot), status: 200
    else
      render status: 422
    end
  end

  def edit
    @spot = Spot.find(params[:id])
    render json: SpotBlueprint.render(@spot)
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      render json: SpotBlueprint.render(@spot), status: 200
    else
      render status: 422
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    render status: 200
  end

  private

  def spot_params
    params.require(:spot).permit(:title, :description, :price, images: [])
  end
end
