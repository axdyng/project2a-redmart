class ProductsController < ApplicationController
  before_action :find_product, only:  [:show]

  def show
    @review = current_user.reviews.build if logged_in?
    # @product_review = Review.where("product_id = ?", params[:id])

  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def permitted_product_params
    params.require(:product).permit(:imgurl, :name, :price, :description)
  end

end
