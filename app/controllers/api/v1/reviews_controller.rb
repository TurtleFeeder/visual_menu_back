class Api::V1::ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :destroy]
  def index
    @reviews = Review.all
    render json: @reviews, status: :ok
  end

  def show
    render json: @review, status: :ok
  end

  def create
    @review = Review.create(review_params)
    render json: @review, status: :created
  end

  def destroy
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :meal_id, :content, :username)
  end


  def find_review
    @review = Review.find(params[:id])
  end
end
