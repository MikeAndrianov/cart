require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [
      create(
        :product,
        name: 'Name',
        code: 'Code',
        price: '9.99',
        img: '🍵'
      ),
      create(
        :product,
        name: 'Name',
        code: 'Code',
        price: '9.99',
        img: '☕️'
      )
    ])
  end

  it 'renders a list of products' do
    render

    assert_select '.card-title', text: Regexp.new('Name'.to_s), count: 2
    assert_select '.card-title>small', text: Regexp.new('Code'.to_s), count: 2
    assert_select '.card>h1', text: Regexp.new('🍵'.to_s), count: 1
    assert_select '.card>h1', text: Regexp.new('☕️'.to_s), count: 1
    assert_select '.card .card-text', text: Regexp.new('€9.99'.to_s), count: 2

  end
end
