class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :name
      t.text :description
      t.jsonb :rules

      t.timestamps
    end
  end
end
