module ApplicationHelper

def logged_in?
	!current_user.nil?
end

def current_user
	if (user_id = session[:user_id]) #Поиск по ключу сессии
		@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id]) #если была метка запомнить меня, у юзера
			user = User.find_by(id: user_id) # есть куки, по которому проверяется
			if user && user.authenticated?(cookies[:remember_token]) # токен также должен совпадать
			log_in(user) # возобновление сеанса на основе куки
			@current_user = user
			end
	end
end

end
