require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @cart = carts(:one)
  end

  test "visiting the index" do
    visit carts_url
    assert_selector "h1", text: "Carts"
  end

  test "destroying a Cart" do
    visit store_index_url
    click_on 'Add to Cart', match: :first
    page.accept_confirm do
      click_on "Empty Cart", match: :first
    end

    assert_text "Your cart is currently empty"
  end
end
