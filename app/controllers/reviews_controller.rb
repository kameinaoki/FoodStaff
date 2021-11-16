class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    # byebug
    @review.save
    redirect_to reviews_path
  end
  
  def index
    @reviews = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def destroy
  end
  
  private
  def review_params
    params.require(:review).permit(:title, :review_image, :rate, :review_content)
  end
  
end
