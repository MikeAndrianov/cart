require 'rails_helper'

RSpec.describe CartDecorator, type: :service do
  let(:cart) { instance_double(ShoppingCart, total: 10) }

  describe '#total_price' do
    it { expect(described_class.new(cart).total_price).to eq('€10.00') }
  end
end
