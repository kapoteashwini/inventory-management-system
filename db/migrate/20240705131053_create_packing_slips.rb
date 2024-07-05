class CreatePackingSlips < ActiveRecord::Migration[7.0]
  def change
    create_table :packing_slips do |t|
      t.references :order, null: false, foreign_key: true
      t.string :packing_slip_number

      t.timestamps
    end
  end
end
