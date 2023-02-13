module Offers
  module DiscountCalculators
    class PercentageDiscountCalculator
      def initialize(cart_item, rules)
        @cart_item = cart_item
        @rules = rules
      end

      def perform
        return 0 unless applicable?

        (@cart_item.quantity * @cart_item.product_price * @rules['drop_amount'] / 100).round(2)
      end

      private

      def applicable?
        @cart_item.quantity >= @rules['buy']
      end
    end
  end
end
