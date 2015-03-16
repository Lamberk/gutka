class UsersController < ApplicationController
	def index
		@var_time = Time.now.to_time.to_i
	end
end
