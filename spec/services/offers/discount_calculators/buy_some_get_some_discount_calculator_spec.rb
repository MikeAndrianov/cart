require 'rails_helper'

RSpec.describe Offers::DiscountCalculators::BuySomeGetSomeDiscountCalculator, type: :service do
  describe '#perform' do
    subject { described_class.new(cart_item, rules).perform }

    let(:rules) do
      {
        'type' => 'buy_some_get_some',
        'buy' => 7,
        'get' => 2
      }
    end

    context 'when discount is not applicable' do
      let(:cart_item) { instance_double(CartItem, quantity: 7) }

      it { is_expected.to eq(0) }
    end

    context 'when offer matches perfectly' do
      let(:cart_item) { instance_double(CartItem, quantity: 18, product_price: 100) }

      it { is_expected.to eq(400) }
    end

    context 'when offer does not match perfectly' do
      let(:cart_item) { instance_double(CartItem, quantity: 29, product_price: 100) }

      it { is_expected.to eq(600)}
    end
  end
end
