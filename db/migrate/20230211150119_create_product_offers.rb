class CreateProductOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :product_offers do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
