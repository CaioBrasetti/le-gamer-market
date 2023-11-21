class ProductsController < ApplicationController
  def index
  end

  def show
    @products = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
