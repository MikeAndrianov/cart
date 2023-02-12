class CartItemDecorator < SimpleDelegator
  include PriceDecoratable

  def price
    decorate_price(product_price)
  end

  def total_price
    decorate_price(total)
  end

  def offers_applied?
    initial_price != total
  end

  def initial_total_price
    decorate_price(initial_price)
  end

  private

  def initial_price
    product_price * quantity
  end
end
