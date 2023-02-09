class ShoppingCart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items

  def total
    cart_items.sum(&:total)
  end
end
