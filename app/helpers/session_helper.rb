module SessionHelper

	def log_in(user)
	session[:user_id] = user.id
	end
	
	def log_out
	forget(current_user)
	session.delete(:user_id)
	@current_user = nil 
	end
	
	def remember(user)
		user.create_token
		cookies.permanent.signed[:user_id] = user.id
		cookies[:remember_token] = user.remember_token
	end
	
	def forget(user)
		user.delete_token
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

end
