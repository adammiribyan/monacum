require 'test_helper'

class LoansHelperTest < ActionView::TestCase
  test "it should calculate interest from days delta and money amount" do
    from_date = Date.today
    to_date = Date.today + 2.days
    amount = 100
    
    assert_equal interest(from_date, to_date, amount), 4
  end
end
