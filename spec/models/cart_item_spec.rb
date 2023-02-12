require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe '#total' do
    let(:cart_item) { build(:cart_item) }
    let(:price_calculator_instance) { instance_double(PriceCalculator) }

    before do
      allow(PriceCalculator).to receive(:new).and_return(price_calculator_instance)
      allow(price_calculator_instance).to receive(:perform)
   end

    it 'triggers price calculator' do
      cart_item.total

      expect(price_calculator_instance).to have_received(:perform)
    end
  end
end
