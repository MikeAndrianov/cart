module Offers
  class DiscountCalculator
    def initialize(price, offer)
      @price = price
      @offer = offer
    end

    def perform()
      case type
      when :siberian_husky
        SiberianHusky.new
      when :golden_retriever
        GoldenRetriever.new
      when :labrador_retriever
        LabradorRetriever.new
      end
    end
  end
end
