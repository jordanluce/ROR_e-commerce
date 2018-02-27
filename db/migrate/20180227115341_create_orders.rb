class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: {on_delete: :cascade}, null: false
      t.references :product, foreign_key: true, null: false
      t.references :size, foreign_key: true, null: false
      t.integer :quantity, null: false, default: 1
      t.decimal :total, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
