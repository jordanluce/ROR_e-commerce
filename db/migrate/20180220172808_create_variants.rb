class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.references :product, foreign_key: {on_delete: :cascade}, null: false
      t.references :size, foreign_key: {on_delete: :cascade}, null: false
      t.integer :inventory, null: false, default: 0

      t.timestamps
    end
  end
end
