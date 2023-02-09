require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  describe '#total' do
    it 'sums total of all cart items' do
      cart = described_class.new

      product = build(:product, price: 10)
      cart_item = build(:cart_item, product: product, quantity: 2)
      second_cart_item = build(:cart_item, product: product, quantity: 1)

      cart.cart_items = [cart_item, second_cart_item]

      expect(cart.total).to eq(30)
    end
  end
end
