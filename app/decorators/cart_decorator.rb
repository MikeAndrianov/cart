class CartDecorator < SimpleDelegator
  include ActionView::Helpers::NumberHelper

  DEFAULT_UNIT = "€".freeze

  def total_price
    number_to_currency(total, unit: DEFAULT_UNIT)
  end
end
