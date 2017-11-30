require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "send_welcome_mail" do
    mail = UserMailer.send_welcome_mail(users(:one))
    assert_equal "Welcome to SU Campus & Environment", mail.subject
    assert_equal ["email@hotmail.com"], mail.to
    assert_equal ["donotreply@sucampusenv.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
