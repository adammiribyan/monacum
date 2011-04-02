module PaymentsHelper
  def left_to_pay_with_interest(loan)
    loan.amount - loan.payments.sum("amount") + interest(Date.today, loan.created_at, loan.amount)
  end
end
