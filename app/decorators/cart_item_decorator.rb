class CartItemDecorator < SimpleDelegator
  include ActionView::Helpers::NumberHelper

  DEFAULT_UNIT = '€'.freeze

  def price
    number_to_currency(product_price, unit: DEFAULT_UNIT)
  end

  def total_price
    number_to_currency(total, unit: DEFAULT_UNIT)
  end
end
