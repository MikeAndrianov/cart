require 'rails_helper'

RSpec.describe CartItemDecorator, type: :service do
  let(:item) { instance_double(CartItem, product_price: 10, total: 20) }

  describe '#price' do
    subject { described_class.new(item).price }

    it "returns product\'s price" do
      is_expected.to eq('€10.00')
    end
  end

  describe '#total_price' do
    subject { described_class.new(item).total_price }

    it { is_expected.to eq('€20.00') }
  end

  describe '#offers_applied?' do
    subject { described_class.new(item).offers_applied? }

    let(:item) { instance_double(CartItem, product_price: 10, total: 20, quantity: quantity) }
    let(:quantity) { 2 }

    it { is_expected.to be_falsey }

    context 'when offers applied' do
      let(:quantity) { 3 }

      it { is_expected.to be_truthy }
    end
  end

  describe '#initial_total_price' do
    subject { described_class.new(item).initial_total_price }

    let(:item) { instance_double(CartItem, product_price: 10, quantity: 2) }


    it "returns product\'s price withouth discounts" do
      is_expected.to eq('€20.00')
    end
  end
end
