require 'rails_helper'

RSpec.describe CartItemDecorator, type: :service do
  let(:item) { instance_double(CartItem, product_price: 10, total: 20) }

  describe '#price' do
    it "returns product\'s price" do
      expect(described_class.new(item).price).to eq('€10.00')
    end
  end

  describe '#total_price' do
    it { expect(described_class.new(item).total_price).to eq('€20.00') }
  end
end
