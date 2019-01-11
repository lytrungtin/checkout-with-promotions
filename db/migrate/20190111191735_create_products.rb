class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :quantity_discount
      t.decimal :price_discount, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :products, :product_code, unique: true
  end
end
