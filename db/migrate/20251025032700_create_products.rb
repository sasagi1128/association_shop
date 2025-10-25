class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price_cents
      t.text :description
      t.integer :stock
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
