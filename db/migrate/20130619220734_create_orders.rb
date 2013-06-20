class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.integer :chapter_id
      t.integer :item_id
      t.integer :quantity
      t.integer :size

      t.timestamps
    end
  end
end
