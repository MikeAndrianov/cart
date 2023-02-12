class ApplicationController < ActionController::Base
  before_action :set_cart

  def set_cart
    @cart ||=
      ShoppingCart
        .includes(cart_items: {product: :offers})
        .find_by(id: session[:cart_id])
        &.then { |cart| CartDecorator.new(cart) }

    unless @cart
      @cart = CartDecorator.new(ShoppingCart.create())

      session[:cart_id] = @cart.id
    end
  end
end
