require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "send_welcome_mail" do
    mail = UserMailer.send_welcome_mail(users(:one))
    assert_equal "send_welcome_mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
