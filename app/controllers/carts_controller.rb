class CartsController < ApplicationController
  def show
    @cart = CartDecorator.new(@cart)
    @cart_items = @cart.cart_items.map(&method(:decorate))
  end

  def add
    @cart_item =
      @cart
        .cart_items
        .find_or_initialize_by(product_id: params[:product_id])
        .increment(:quantity)
        .then(&method(:decorate))
        .tap(&:save)

    @cart.reload
  end

  def remove
    @cart_item =
      @cart
        .cart_items
        .find_by(product_id: params[:product_id])
        .then(&method(:decorate))

    if @cart_item.quantity > 1
      @cart_item.decrement!(:quantity)
    else
      @cart_item.destroy
    end

    @cart.reload
  end

  private

  def decorate(cart_item)
    CartItemDecorator.new(cart_item)
  end
end
