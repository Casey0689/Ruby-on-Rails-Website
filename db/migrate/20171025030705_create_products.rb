class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity_on_hand
      t.decimal :low_price_range
      t.decimal :high_price_range
      t.decimal :cost_to_company
      t.decimal :shipping_weight
      t.string :thumb_image
      t.string :full_image

      t.timestamps
    end
  end
end
