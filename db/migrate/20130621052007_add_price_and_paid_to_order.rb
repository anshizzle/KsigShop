class AddPriceAndPaidToOrder < ActiveRecord::Migration
  def self.up
  	add_column :orders, :paid, :boolean, :default => false
  	add_column :orders, :price, :decimal, :precision => 8, :scale => 2, :default => 0.0
  end
  def self.down
  	remove_column :orders, :paid
  	remove_column :orders, :price
  end
end
