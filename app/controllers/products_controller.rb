class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 5)
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
