class ReviewsController < ApplicationController
  # before_action :find_review,    only:  [:destroy]
  before_action :require_login,  only:  [:create, :destroy]

  before_action :correct_user,   only: :destroy


  def create
    @review = current_user.reviews.build(permitted_review_params)
    @product = Product.find(params[:id])

    if @review.save
      flash[:success] = 'Review submitted'
      redirect_to product_url
    else
      render 'products/show'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || root_url
  end

  private

    # def find_review
    #   @review = Review.find(params[:id])
    # end

    def permitted_review_params
      params.require(:review).permit(:content, :product_id)
    end

    def correct_user
     @review = current_user.reviews.find_by(id: params[:id])
     redirect_to root_url if @review.nil?
    end
end
