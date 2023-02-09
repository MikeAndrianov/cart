require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe '#total' do
    it 'calculates based on quantity' do
      product = create(:product, price: 2)
      cart_item = create(:cart_item, product: product, quantity: 4)

      expect(cart_item.total).to eq(8)
    end
  end
end
