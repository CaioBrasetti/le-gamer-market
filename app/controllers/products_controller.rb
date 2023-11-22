class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.all
    if params[:category].present?
      @products = @products.where("category Ilike ?", params[:category])
    end
  end

  def show
    @product = Product.find(params[:id])
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
  end

  def destroy
    @product.destroy
    redirect_to list_path(@bookmark.movie), status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :category)
  end
end
