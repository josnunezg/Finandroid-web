require 'test_helper'

class ExpensesMailerTest < ActionMailer::TestCase
  test "new_expense" do
    mail = ExpensesMailer.new_expense
    assert_equal "New expense", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
