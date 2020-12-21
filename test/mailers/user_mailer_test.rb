require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "user_welcome_mail" do
    mail = UserMailer.user_welcome_mail
    assert_equal "User welcome mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
