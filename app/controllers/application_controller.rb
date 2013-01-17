class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

	def after_sign_in_path_for(resource)
		if current_user.is_admin?
			users_path
		else
			profile_path
		end 
	end

	def after_sign_up_path_for(resource)
		if current_user.is_admin?
			users_path
		else
			profile_path
		end
	end

	protected
	
		def authorize
			unless current_user.is_admin?
				redirect_to root_url , :notice => "You are not an admin !"
			end
		end

end
