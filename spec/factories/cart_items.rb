FactoryBot.define do
  factory :cart_item do
    product
    shopping_cart
    quantity { 1 }
  end
end
