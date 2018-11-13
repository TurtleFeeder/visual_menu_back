class Api::V1::MealsController < ApplicationController
  before_action :find_meal, only: [:show, :destroy]
  def index
    @meals = Meal.all
    render json: @meals, status: :ok
  end

  def show
    render json: @meal, status: :ok
  end

  def create
    @meal = Meal.create(meal_params)
    render json: @meal, status: :created
  end

  def destroy
    @meal.destroy
  end

  private

  def meal_params
    params.require(:meal).permit(:imgurl, :description, :restaurant_id, :price, :name)
  end

  def find_meal
    @meal = Meal.find(params[:id])
  end
end
