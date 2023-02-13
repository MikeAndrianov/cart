require 'rails_helper'

RSpec.describe Offers::DiscountCalculators::FixedDiscountCalculator, type: :service do
  describe '#perform' do
    subject { described_class.new(cart_item, rules).perform }

    let(:cart_item) { instance_double(CartItem, quantity: 14, product_price: 100) }
    let(:rules) do
      {
        'type' => 'bulk_purchase',
        'price_drop_type' => 'fixed',
        'drop_amount' => 10,
        'buy' => 7
      }
    end

    context 'when discount is not applicable' do
      let(:cart_item) { instance_double(CartItem, quantity: 5) }

      it { is_expected.to eq(0) }
    end

    context 'when offer matches perfectly' do
      let(:cart_item) { instance_double(CartItem, quantity: 7, product_price: 100) }

      it { is_expected.to eq(70) }
    end

    it { is_expected.to eq(140)}
  end
end
