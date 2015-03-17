class UsersController < ApplicationController
	def index
		@users = User.new
		@var_time = Time.now.to_time.to_i
	end

	def show
	end

end
