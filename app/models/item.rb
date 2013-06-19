class Item < ActiveRecord::Base
  attr_accessible :name, :price, :picture
  has_attached_file :picture, :styles => { :full => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
