class ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.create(reviews_params)
    redirect_to @review.entreprise
  end

  def destroy
    @review = Review.find(params[:id])
    entreprise = @review.entreprise
    @review.destroy
    redirect_to entreprise
  end

  private
  def reviews_params
    params.require(:review).permit(:comment, :star, :entreprise_id)
  end

end
