require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Address", with: @order.address
    fill_in "End user", with: @order.end_user_id
    fill_in "Method payment", with: @order.method_payment
    fill_in "Name", with: @order.name
    fill_in "Order status", with: @order.order_status
    fill_in "Post number", with: @order.post_number
    fill_in "Postage", with: @order.postage
    fill_in "Totsl payment", with: @order.totsl_payment
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address
    fill_in "End user", with: @order.end_user_id
    fill_in "Method payment", with: @order.method_payment
    fill_in "Name", with: @order.name
    fill_in "Order status", with: @order.order_status
    fill_in "Post number", with: @order.post_number
    fill_in "Postage", with: @order.postage
    fill_in "Totsl payment", with: @order.totsl_payment
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
