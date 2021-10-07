class ProductsController < ApplicationController
  def index
    @search = Product.search do
      fulltext params[:search]
    end
    @products = @search.results
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
