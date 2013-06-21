class PaymentNotification < ActiveRecord::Base
  attr_accessible :order_id, :params, :status, :transaction_id

  belongs_to :order
  serialize :params
  after_create :mark_order_as_paid
  

private
  def mark_order_as_paid
    if status == "Completed"
      order.update_attributes(:paid => true)
    end
  end
end
