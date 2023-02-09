FactoryBot.define do
  factory :product do
    sequence(:code) { |n| "GR#{n}" }
    name { 'Green Tea' }
    img { '🍵' }
    price { 3.11 }
  end
end
