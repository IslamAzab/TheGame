class SessionsController < Devise::SessionsController
	skip_before_filter :authorize #, :only => [:destroy]
end
