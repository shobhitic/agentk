require 'test_helper'

class SubscriberMailerTest < ActionMailer::TestCase
  test "verify" do
    mail = SubscriberMailer.verify
    assert_equal "Verify", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
