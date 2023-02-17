class ReviewsController < ApplicationController
  def list_reviews
    @spot =Spot.find(params[:id])
    @reviews=@spot.reviews

    render json: ReviewBlueprint.render(@reviews)
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @review = @spot.reviews.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @review = @spot.reviews.create(review_params)
    if @review.save   

      render json: ReviewBlueprint.render(@review), status: 200 
    else
      render status: 422
    end
  end

  def edit
      @review = Review.find(params[:id])

      render json: ReviewBlueprint.render(@review)
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      render json: ReviewBlueprint.render(@review), status: 200
    else
      render status: 422
    end
  end

  private
  def review_params
    params.require(:review).permit(:content)
  end
end
