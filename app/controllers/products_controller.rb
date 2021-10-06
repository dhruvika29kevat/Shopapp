class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = Product.search(params[:query]).paginate(page: params[:page], per_page: 5)
    else
      @products = Product.paginate(page: params[:page], per_page: 5)    
    end
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
