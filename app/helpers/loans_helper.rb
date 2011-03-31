# encoding: utf-8

module LoansHelper
  def interest(from_date, to_date, amount, percents = 0.02)
    (from_date.to_date - to_date.to_date) * percents * amount.to_i
  end
  
  def number_to_date(number)
    label = Russian.p(number, "день", "дня", "дней")
    "#{number} #{label}"    
  end
  
  def loan_title(loan)
    @loan = loan if loan.present?
    
    rubles = Russian.p(@loan.amount, "рубль", "рубля", "рублей")
    days   = Russian.p(@loan.term, "день", "дня", "дней")
    
    "#{@loan.amount} #{rubles} на #{@loan.term} #{days}"
  end
end
