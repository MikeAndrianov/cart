class Product < ApplicationRecord
  validates :name, :price, :code, presence: true
  validates :code, uniqueness: true

  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  has_many :product_offers
  has_many :offers, through: :product_offers
end
