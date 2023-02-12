class ProductDecorator < SimpleDelegator
  include PriceDecoratable

  def price
    decorate_price(__getobj__.price)
  end

  def has_offers?
    offers.any?
  end

  def offer_details
    offers.pluck(:description).join(' ')
  end
end
