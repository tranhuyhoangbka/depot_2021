require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Name:", with: 'daveka'
    fill_in "Password:", with: 'secret'
    fill_in "Confirm:", with: 'secret'
    click_on "Create User"

    assert_text "daveka was successfully created"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Name:", with: @user.name
    fill_in "Password:", with: 'secret'
    fill_in "Confirm:", with: 'secret'
    click_on "Update User"

    assert_text "#{@user.name} was successfully updated"
  end

  # test "destroying a User" do
  #   visit users_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "User was successfully destroyed."
  # end
end
