class Loan < ActiveRecord::Base
  belongs_to :client
  scope :unpaid, :conditions => { :is_repaid => false }
  
  validates :amount, :term, :presence => true  
  
  def overdue
    # the day count from loans created at to today is less then loans term
    # and loans is_repaid equals to false
  end
  
  def current
    # the day count from loans created at to today is more then loans term
    # and loans is_repaid equals to false
  end
  
  def completed
    # loans is_repaid equals to true
  end
end
