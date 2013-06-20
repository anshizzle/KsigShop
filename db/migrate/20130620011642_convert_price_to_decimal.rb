class ConvertPriceToDecimal < ActiveRecord::Migration
  def up
  	remove_column :items, :price
  	add_column	:items, :price, :decimal, :precision => 8, :scale => 2, :default => 0.0

  end

  def down
  	remove_column :items, :price
  	add_column 	:items, :price, :integer
  end
end
