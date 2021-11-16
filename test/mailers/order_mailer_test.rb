require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["#{orders(:one).email}"], mail.to
    assert_equal ["tranhuyhoang.bk.1992@gmail.com"], mail.from
    assert_match "MyString2", mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["#{orders(:one).email}"], mail.to
    assert_equal ["tranhuyhoang.bk.1992@gmail.com"], mail.from
    assert_match "MyString2", mail.body.encoded
  end

end
