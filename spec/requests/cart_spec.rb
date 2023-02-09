require 'rails_helper'

RSpec.describe 'Carts', type: :request do
  describe 'GET /cart' do
    it 'returns http success' do
      get '/cart'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /cart/add' do
    let(:cart) { create(:shopping_cart) }
    let(:cart_item) { create(:cart_item, shopping_cart: cart) }

    before do
      allow(ShoppingCart).to receive_message_chain(:includes, :find_by).and_return(cart)
    end

    it 'returns http success' do
      post(
        '/cart/add',
        params: { product_id: cart_item.product_id },
        as: :turbo_stream
      )

      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /cart/remove' do
    let(:cart) { create(:shopping_cart) }
    let(:cart_item) { create(:cart_item, shopping_cart: cart, quantity: 1) }

    before do
      allow(ShoppingCart).to receive_message_chain(:includes, :find_by).and_return(cart)
    end

    it 'returns http success' do
      delete(
        '/cart/remove',
        params: { product_id: cart_item.product_id },
        as: :turbo_stream
      )

      expect(response).to have_http_status(:success)
    end
  end
end
