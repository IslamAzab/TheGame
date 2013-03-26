require 'test_helper'

class ResultNotifierTest < ActionMailer::TestCase
  test "coach_changed_result" do
    mail = ResultNotifier.coach_changed_result
    assert_equal "Coach changed result", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
