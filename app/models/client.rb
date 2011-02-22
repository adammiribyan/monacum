class Client < ActiveRecord::Base
  def fullname
    [last_name, first_name, middle_name].join(' ')
  end
  
  def fullname=(name)
    split = name.split(' ', 3)
    self.last_name = split.first
    self.first_name = split.second
    self.middle_name = split.last
  end
  
end
