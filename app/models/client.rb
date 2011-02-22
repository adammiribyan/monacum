class Client < ActiveRecord::Base
  def full_name
    [personal_last_name, personal_first_name, personal_surname].join(' ')
  end
  
  def full_name=(name)
    split = name.split(' ', 3)
    self.personal_last_name = split.first
    self.personal_first_name = split.second
    self.personal_surname = split.last
  end
  
end
