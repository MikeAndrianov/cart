require 'rails_helper'

RSpec.describe "carts/show.html.erb", type: :view do
  let(:product) { create(:product, name: 'tea', code: 'GR1', price: 9.99) }
  let(:another_product) { create(:product, name: 'honey', code: 'HR1', price: 10.00) }
  let(:cart) { create(:shopping_cart) }
  let(:item) { create(:cart_item, shopping_cart: cart, product: product, quantity: 1) }
  let(:another_item) { create(:cart_item, shopping_cart: cart, product: another_product, quantity: 2) }

  it 'renders cart items and total price' do
    assign(:cart, CartDecorator.new(cart))
    assign(:cart_items, [CartItemDecorator.new(item), CartItemDecorator.new(another_item)])

    render

    assert_select '#cart-items>li', text: Regexp.new('tea'), count: 1
    assert_select '#cart-items>li', text: Regexp.new('honey'), count: 1
    assert_select '#total', text: Regexp.new('€29.99'), count: 1
  end

end
