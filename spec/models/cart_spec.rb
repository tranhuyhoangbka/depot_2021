require 'rails_helper'

RSpec.describe Cart, type: :model do
  fixtures :products

  subject(:cart){Cart.new}

  let(:book_one){products(:one)}
  let(:book_two){products(:two)}

  describe "#add_product" do
    context "Add unique products" do
      before do
        cart.add_product(book_one).save!
        cart.add_product(book_two).save!
      end

      it "has two line items" do
        expect(cart.line_items.size).to eq(2)
      end

      it "has a total price of the two items' price" do
        expect(cart.total_price).to eq(book_one.price + book_two.price)
      end
    end

    context "Add dupplicate products" do
      before do
        cart.add_product(book_one).save!
        cart.add_product(book_one).save!
      end

      it "has one line item" do
        expect(cart.line_items.size).to eq(1)
      end

      it "has a line item with a quantity of 2" do
        expect(cart.line_items.first.quantity).to eq(2)
      end

      it "has a total price of twice the product's price" do
        expect(cart.total_price).to eq(book_one.price * 2)
      end
    end
  end
end
