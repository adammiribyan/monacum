class Client < ActiveRecord::Base
  has_many :loans
  
  mount_uploader :photo, PhotoUploader
  
  validates :personal_first_name, :personal_last_name, :persona_surname, :presence => true
  
  def full_name
    [personal_last_name, personal_first_name, personal_surname].join(' ')
  end
  
  def full_name=(name)
    split = name.split(' ', 3)
    self.personal_last_name = split.first
    self.personal_first_name = split.second
    self.personal_surname = split.last
  end
  
  def current_loan
    self.loans.unpaid.first
  end  
  
end