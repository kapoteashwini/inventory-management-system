class CreateInventoryAdjustments < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_adjustments do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.string :adjustment_type

      t.timestamps
    end
  end
end
