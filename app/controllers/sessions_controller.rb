class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
  	user = User.find_by(username: params[:username])
  	time = Time.now.to_i.to_s
  	query = ActiveRecord::Base.connection()
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		user_id = user.id.to_s
  		query.execute("UPDATE users SET date_last_visited = " +time+ " WHERE id = " +user_id)
  		redirect_to users_url
  	else
  		redirect_to login_url
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url
  end
end
