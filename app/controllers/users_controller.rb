class UsersController < ApplicationController
	def index
		@var_date_now = Time.now.to_time.to_i
		@users = User.order(:date_last_visited, ":desc")
	end

	def new
		@user = User.new
		@caption = 'Новый пользователь'
	end

	def edit
		@caption = 'Изменение информации'
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		pass1 = params[:user][:password]
		pass2 = params[:user][:password_confirmation]
		if pass1 == pass2 
			if @user.save
				redirect_to users_url
			else
				render 'new'
			end
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to users_url
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_url
	end

	private
	  def user_params
	    params.require(:user).permit(:name, :username, :password)
	  end

end
