class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def search
    @query = params[:query]
    @products = Product.where("products.name LIKE ?", ["%#{@query}%"])
    render "index"
  end
end
