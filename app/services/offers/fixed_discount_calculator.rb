module Offers
  class FixedDiscountCalculator
    def initialize(cart_item, rules)
      @cart_item = cart_item
      @rules = rules
    end

    def perform
      return 0 unless applicable?

      @rules['drop_amount'] * @cart_item.quantity
    end

    private

    def applicable?
      @cart_item.quantity >= @rules['buy']
    end
  end
end
