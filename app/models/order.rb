require 'pago'

class Order < ApplicationRecord
  enum pay_type: {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
  }

  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      self.line_items << line_item
    end
  end

  def charge!(pay_type_params)
    payment_details = {}
    payment_method = nil

    case pay_type
    when "Check"
      payment_method = :check
      payment_details = {routing: pay_type_params[:routing_number],
        account: pay_type_params[:account_number]}
    when "Credit card"
      payment_method = :credit_card
      month, year = pay_type_params[:expiration_date].split("/")
      payment_details = {cc_num: pay_type_params[:credit_card_number],
        expiration_month: month, expiration_year: year}
    when "Purchase order"
      payment_method = :po
      payment_details = {po_num: pay_type_params[:po_number]}
    end
    payment_result = Pago.make_payment(order_id: id,
      payment_method: payment_method, payment_details: payment_details)
    if payment_result.successed?
      OrderMailer.received(self).deliver_later
    else
      raise payment_result.error
    end
  end
end
