class CombineItemsInCart < ActiveRecord::Migration[6.1]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          cart.line_items.where(product_id: product_id).delete_all
          cart.line_items.create product_id: product_id, quantity: quantity
        end
      end
    end
  end

  def down
    LineItem.where('quantity > 1').each do |line_item|
      line_item.quantity.times do
        new_line_item = line_item.dup
        new_line_item.quantity = 1
        new_line_item.save
      end
      line_item.destroy
    end
  end
end
