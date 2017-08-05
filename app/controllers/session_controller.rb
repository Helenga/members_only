class SessionController < ApplicationController
include SessionHelper

  def new
  end

  def create
	@user = User.find_by(name: params[:name])
	if @user && @user.authenticate(params[:password])
		log_in @user
		params[:remember_me] == '1' ? remember(@user) : forget(@user)
		redirect_to root_url
	else
		flash.now[:error]="Error. It can't find user with such name"
		render 'new'
	end
/	есть ли юзер в БД => метод проверки соответствия ввода current_user
	назначение сессии = метод log_in
	если флажок запомнить = установка куки = метод remember
/ 
  end

  def destroy
	log_out #if logged_in?
	redirect_to root_path
  end
end
