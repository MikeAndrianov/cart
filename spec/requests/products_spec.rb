require 'rails_helper'

RSpec.describe "/products", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      create(:product)
      get(products_url)

      expect(response).to be_successful
    end
  end
end
