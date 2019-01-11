class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.string :code
      t.decimal :min_total_price, :precision => 8, :scale => 2
      t.integer :discount_rate, :precision => 2, :scale => 2
      t.boolean :includes_discount_item

      t.timestamps
    end
    add_index :promotions, :code, unique: true
  end
end
