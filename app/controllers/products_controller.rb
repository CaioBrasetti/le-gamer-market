class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_product, only: %i[edit update destroy show]

  def index
    @products = Product.all
    if params[:category].present?
      @products = @products.where("category ILIKE ?", params[:category])
    end
  end

  def show
    @order = Order.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :category, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
