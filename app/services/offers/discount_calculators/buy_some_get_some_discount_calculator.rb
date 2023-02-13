module Offers
  module DiscountCalculators
    class BuySomeGetSomeDiscountCalculator
      def initialize(cart_item, rules)
        @cart_item = cart_item
        @rules = rules
      end

      def perform
        return 0 unless applicable?

        discountable_quantity = @cart_item.quantity * @rules['get'] / (@rules['buy'] + @rules['get'])
        @cart_item.product_price * discountable_quantity
      end

      private

      def applicable?
        @cart_item.quantity >= @rules['buy'] + @rules['get']
      end
    end
  end
end
