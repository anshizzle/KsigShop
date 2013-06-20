class Item < ActiveRecord::Base
  attr_accessible :name, :price, :picture, :preorderdate, :preorderprice
  has_attached_file :picture, :styles => { :full => "300x300", :thumb => "100x100>" }, :default_url => ":style/missing.png"
  has_many :orders


end
