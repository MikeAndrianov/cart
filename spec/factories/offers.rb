FactoryBot.define do

  # TODO: create factories for different types of offers
  #

  factory :offer do
    name { 'Third is free' }
    description { 'Buy 2 products and get one for free!' }
    rules { { type: 'buy_some_get_some', buy: 2, get: 1 } }
  end
end
