class AddPreOrderInfoOptionsToItems < ActiveRecord::Migration
  def self.up
  	 add_column	:items, :preorderprice, :decimal, :precision => 8, :scale => 2, :default => 0.0
  	 add_column :items, :preorderdate, :date
  end
  def self.down
  	remove_column :items, :preorderprice
  	remove_column :items, :preorderdate
  end
end
