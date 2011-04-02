class Loan < ActiveRecord::Base
  belongs_to :client
  has_many :payments
  
  scope :unpaid, :conditions => { :is_repaid => false }
  scope :repaid, :conditions => { :is_repaid => true }
  
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
  
  # find_created_in_last(7.months)
  def self.find_started_in_last(time_span)
    old_time = Date.today - time_span
    all(:conditions => ["created_at > ?", old_time.to_s(:db)])
  end
end
