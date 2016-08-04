class ProductsController < ApplicationController
  before_action :find_product, only:  [ :show ]

  def index
    @products = Product.search(params[:search])
    if @products.present?
      flash.now[:success] =  @products.count.to_s + ' Records Found!'
    else
      flash.now[:info]    = 'No Records Found!'
    end
  end

  def show
    @review = current_user.reviews.build if logged_in?
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def permitted_product_params
    params.require(:product).permit(:imgurl, :name, :price, :description)
  end

end
