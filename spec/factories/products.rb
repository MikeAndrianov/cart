FactoryBot.define do
  factory :product do
    code { 'GR1' }
    name { 'Green Tea' }
    img { '🍵' }
    price { 3.11 }
  end
end
