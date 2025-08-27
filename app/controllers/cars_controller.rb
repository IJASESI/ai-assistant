class CarsController < ApplicationController
  before_action :authenticate_user!

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :year)
  end
end
