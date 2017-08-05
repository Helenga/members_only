class RumorsController < ApplicationController
include RumorsHelper

before_action :has_prime_key?, except: :index

def index
	@rumors = Rumor.all
end

def new
	@rumor = current_user.rumors.new
end

def create
	@rumor = current_user.rumors.new(rumor_params)
	if @rumor.save
		redirect_to root_url
	else
		render 'new'
	end
end

private

def rumor_params
	params.require(:rumor).permit(:about, :body, :user_id)
end

end
