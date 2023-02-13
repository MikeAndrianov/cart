require 'rails_helper'

RSpec.describe Offers::DiscountCalculators::PercentageDiscountCalculator, type: :service do
  describe '#perform' do
    subject { described_class.new(cart_item, rules).perform }

    let(:cart_item) { instance_double(CartItem, quantity: quantity, product_price: 60) }
    let(:quantity) { 4 }
    let(:rules) do
      {
        'type' => 'bulk_purchase',
        'price_drop_type' => 'percentage',
        'drop_amount' => 33.33,
        'buy' => 3
      }
    end

    context 'when discount is not applicable' do
      let(:quantity) { 2 }

      it { is_expected.to eq(0) }
    end

    context 'when offer matches perfectly' do
      let(:quantity) { 8 }

      it { is_expected.to eq(159.98) }
    end

    it { is_expected.to eq(79.99)}
  end
end
