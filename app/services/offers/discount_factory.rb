module Offers
  class DiscountFactory
    def self.build(rules)
      type = rules['type']

      case type
      when 'buy_some_get_some'
        DiscountCalculators::BuySomeGetSomeDiscountCalculator
      when 'bulk_purchase'
        BulkPurchaseFactory.build(rules)
      else
        Rails.logger.error("Invalid rule type: #{type}")
      end
    end
  end
end
