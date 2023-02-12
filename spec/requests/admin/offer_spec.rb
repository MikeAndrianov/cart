require 'rails_helper'

RSpec.describe 'Offers', type: :request do
  let(:auth_credentials) do
    ActionController::HttpAuthentication::Basic
      .encode_credentials(
        Rails.application.credentials.basic_auth.login,
        Rails.application.credentials.basic_auth.password
      )
  end

  describe 'GET /index' do
    it 'returns http unauthorized' do
      get '/admin/offers'

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns http success' do
      get '/admin/offers', headers: { Authorization: auth_credentials }

      expect(response).to have_http_status(:success)
    end
  end


  describe 'GET /offers/new' do
    it 'returns http success' do
      get '/admin/offers/new', headers: { Authorization: auth_credentials }

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /offers/:id/edit' do
    let(:offer) { create(:offer) }

    it 'returns http success' do
      get edit_admin_offer_path(offer), headers: { Authorization: auth_credentials }

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /offers' do
    let(:product) { create(:product) }
    let(:valid_attributes) do
      {
        name: 'Offer',
        description: 'Description of the offer.' ,
        rules: { type: 'bulk_purchase' }.to_json,
        product_ids: [product.id]
      }
    end

    context 'with valid parameters' do
      it 'creates a new Offer' do
        expect {
          post admin_offers_path, params: { offer: valid_attributes }, headers: { Authorization: auth_credentials }
        }.to change(Offer, :count).by(1)
      end

      it 'redirects to the created offer' do
        post admin_offers_path, params: { offer: valid_attributes }, headers: { Authorization: auth_credentials }

        expect(response).to redirect_to(admin_offers_path)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: '', description: '' } }

      it 'does not create a new Offer' do
        expect {
          post admin_offers_path, params: { offer: invalid_attributes }, headers: { Authorization: auth_credentials }
        }.to change(Offer, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    let(:offer) { create(:offer) }

    context 'with valid parameters' do
      let(:new_attributes) { { description: 'updated description' } }

      it 'updates the requested offer' do
        patch admin_offer_url(offer), params: { offer: new_attributes }, headers: { Authorization: auth_credentials }

        expect(offer.reload.description).to eq('updated description')
      end

      it 'redirects to the offers page' do
        patch admin_offer_url(offer), params: { offer: new_attributes }, headers: { Authorization: auth_credentials }

        expect(response).to redirect_to(admin_offers_url)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: '', description: '' } }

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch admin_offer_url(offer), params: { offer: invalid_attributes }, headers: { Authorization: auth_credentials }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:offer) { create(:offer) }

    it 'destroys the requested offer' do
      expect {
        delete admin_offer_url(offer), headers: { Authorization: auth_credentials }
      }.to change(Offer, :count).by(-1)
    end

    it 'redirects to the offers list' do
      delete admin_offer_url(offer), headers: { Authorization: auth_credentials }

      expect(response).to redirect_to(admin_offers_url)
    end
  end
end
