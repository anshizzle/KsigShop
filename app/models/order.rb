# => chapter_id			integer
# => first_name			string
# => last_name			string


class Order < ActiveRecord::Base
  attr_accessible :chapter_id, :first_name, :item_id, :last_name, :quantity, :size, :price, :paid
  belongs_to :item

  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
  validates :first_name, :last_name, :chapter_id, :item_id, :quantity, :size, :presence => true

  def paypal_url(return_url, notify_url)
 	values = {
 	    :business => 'mysigmashop-facilitator@gmail.com',
  		:cmd => '_xclick',
 	 	:upload => 1,
    	:return => return_url,
    	:invoice => self.id,
      :notify_url => notify_url
  	}
   values.merge!({
      	"amount" => price,
      	"item_name" => Item.find(self.item_id).name,
        "item_number" => self.item_id,
   		"quantity" => self.quantity
    })
  	"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end
