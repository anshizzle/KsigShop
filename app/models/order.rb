# => chapter_id			integer
# => first_name			string
# => last_name			string


class Order < ActiveRecord::Base
  attr_accessible :chapter_id, :first_name, :item_id, :last_name, :quantity, :size
  belongs_to :item

  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
  validates :first_name, :last_name, :presence => true

end
