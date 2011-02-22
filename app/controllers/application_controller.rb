class ApplicationController < ActionController::Base
  protect_from_forgery
  autocomplete :client, :personal_last_name, :full => true
  
end
