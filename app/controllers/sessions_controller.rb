class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to users_url
  	else
  		redirect_to login_url
  	end
  end

  def destroy
  end
end
