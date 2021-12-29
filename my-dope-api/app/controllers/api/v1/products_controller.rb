class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def create
    product = Product.new(
      name: prod_params[:name],
      brand: prod_params[:brand],
      price: prod_params[:price],
      description: prod_params[:description])
    if product.save 
      render json: product, status: 200
    else
      render json: {"Error creating the product"}
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    if product 
      render json: product, status: 200
    else
      render json: {"Product Not Found"}
    end
  end


  private
  def prod_params
    params.require(:product).permit([:name, :brand, :price, :description])
  end
end
