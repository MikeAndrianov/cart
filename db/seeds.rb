green_tea =
  Product.create(
    {
      code: 'GR1',
      name: 'Green Tea',
      img: '🍵',
      price: 3.11
    }
  )

strawberries =
  Product.create(
    {
      code: 'SR1',
      name: 'Strawberries',
      img: '🍓',
      price: 5.00
    }
  )

coffee =
  Product.create(
    {
      code: 'CF1',
      name: 'Coffee',
      img: '☕️',
      price: 11.23
    }
  )

Product.create(
  [
    {
      code: 'MD2',
      name: 'Waffles',
      img: '🧇',
      price: 10.20
    },
    {
      code: 'LP6',
      name: 'Honey',
      img: '🍯',
      price: 25.00
    }
  ]
)

Offer.create(
  [
    {
      name: 'Buy one – get one',
      description: 'Buy one – get one for free!',
      rules: {
        type: 'buy_some_get_some',
        buy: 1,
        get: 1
      }.to_json,
      product_ids: [green_tea.id]
    },
    {
      name: 'Drop EUR 0.50 for 3 or more products',
      description: 'Buy 3 or more to get €0.50 discount for each product!',
      rules: {
        type: 'bulk_purchase',
        price_drop_type: 'fixed',
        drop_amount: 0.5,
        buy: 3
      }.to_json,
      product_ids: [strawberries.id]
    },
    {
      name: 'Drop 33.33% for 3 or more products',
      description: 'Buy 3 or more to get 33.33% discount for each product!',
      rules: {
        type: 'bulk_purchase',
        price_drop_type: 'percentage',
        drop_amount: 33.33,
        buy: 3
      }.to_json,
      product_ids: [coffee.id]
    }
  ]
)
