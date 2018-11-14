class Api::V1::RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :destroy]
  def index
    @restaurants = Restaurant.all
    render json: @restaurants, status: :ok
    # render json: @restaurants, include: '**', status: :ok
  end

  def show
    render json: @restaurant, status: :ok
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    render json: @restaurant, status: :created
  end

  def destroy
    @restaurant.destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :hours, :location, :phone)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end # end RestaurantsController class
