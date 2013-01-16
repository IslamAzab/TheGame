class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def after_sign_up_path_for(resource) 

		"www.google.com" 

	end
end
