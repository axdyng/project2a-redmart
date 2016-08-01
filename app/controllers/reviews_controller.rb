class ReviewsController < ApplicationController
  before_action :require_login,  only:  [:create, :destroy]

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
  end

  private
    def permitted_review_params
      params.require(:review).permit(:content, :product_id)
    end
end
