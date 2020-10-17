require 'test_helper'

class EventMailerTest < ActionMailer::TestCase
  test "photo" do
    mail = EventMailer.photo
    assert_equal "Photo", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
