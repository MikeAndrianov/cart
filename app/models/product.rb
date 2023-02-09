class Product < ApplicationRecord
  validates :name, :price, :code, presence: true
  validates :code, uniqueness: true

  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
end
