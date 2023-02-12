class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart, touch: true

  delegate :img, :name, :code, :price, to: :product, prefix: true

  def total
    PriceCalculator.new(self).perform
  end
end
