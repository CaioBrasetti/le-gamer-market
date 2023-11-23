class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    # verbo post, criaçar de uma order com os parametros pré defenidos
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.product = @product

    @order.price_transactions = @product.price * @order.quantity
      if @order.save
        @product.update(quantity: @product.quantity - @order.quantity)
        current_user.update(balance: current_user.balance - @order.price_transactions)
        redirect_to order_path(@order)
      else
        render 'products/show', status: :unprocessable_entity, notice: @order.errors.full_messages
      end
  end

  private

  def order_params
    params.require(:order).permit(:quantity)
  end
end
