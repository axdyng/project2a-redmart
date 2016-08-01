class ReviewsController < ApplicationController
  before_action :require_login,  only:  [:create, :destroy]

  def create
    @review = current_user.reviews.build(permitted_review_params)

    if @review.save
      flash[:success] = 'Review submitted'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private
    def permitted_review_params
      params.require(:review).permit(:content)
    end
end
