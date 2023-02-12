class Offer < ApplicationRecord
  validates :name, :rules, :description, presence: true
  validates :name, uniqueness: true

  has_many :product_offers
  has_many :products, through: :product_offers

  accepts_nested_attributes_for :products, allow_destroy: true
end
