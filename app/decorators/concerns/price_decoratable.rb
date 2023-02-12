module PriceDecoratable
  extend ActiveSupport::Concern

  include ActionView::Helpers::NumberHelper

  DEFAULT_UNIT = "€".freeze

  included do
    def decorate_price(price)
      number_to_currency(price, unit: DEFAULT_UNIT)
    end
  end
end
