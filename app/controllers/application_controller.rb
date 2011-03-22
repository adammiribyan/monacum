class ApplicationController < ActionController::Base
  protect_from_forgery
  autocomplete :client, :personal_full_name, :full => true

end
