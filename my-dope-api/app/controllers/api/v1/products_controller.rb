class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def create

  end

  def show
  end


  private
  def prod_params
    params.require(:product).permit([:name, :brand, :price, :description])
  end
end
