class Item < ActiveRecord::Base
  attr_accessible :name, :price, :picture
  has_attached_file :picture, :styles => { :full => "500x500>", :thumb => "100x100>" }, :default_url => ":style/missing.png"
  has_many :orders


end
