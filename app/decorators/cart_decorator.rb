class CartDecorator < SimpleDelegator
  include PriceDecoratable

  def total_price
    decorate_price(total)
  end
end
