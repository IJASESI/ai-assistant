class CarsController < ApplicationController
  before_action :authenticate_user!

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @cars = current_user.cars
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :year)
  end
end
