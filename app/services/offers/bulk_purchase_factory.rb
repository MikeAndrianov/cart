module Offers
  class BulkPurchaseFactory
    def self.build(rules)
      price_drop_type = rules['price_drop_type']

      case price_drop_type
      when 'percentage'
        DiscountCalculators::PercentageDiscountCalculator
      when 'fixed'
        DiscountCalculators::FixedDiscountCalculator
      else
        Rails.logger.error("Invalid price_drop_type: #{price_drop_type}")
      end
    end
  end
end
