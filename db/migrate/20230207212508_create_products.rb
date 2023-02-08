class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :img
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
