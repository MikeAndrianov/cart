class PriceCalculator
  def initialize(cart_item)
    @cart_item = cart_item
    @offers = @cart_item.product.offers
  end

  def perform
    base_price = @cart_item.product_price * @cart_item.quantity
    return base_price unless @offers.any?

    discount_amount > base_price ? 0 : base_price - discount_amount
  end

  private

  # FUY: all discounts are applied to the base price
  #
  def discount_amount
    @discount_amount ||=
      @offers.sum do |offer|
        rules = JSON.parse(offer.rules)

        Offers::DiscountFactory.build(rules).new(@cart_item, rules).perform
      end
  end
end
