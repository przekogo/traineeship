class UsersController < ApplicationController
  	before_action :authenticate_user!
	def index
		@users = User.all
	end

	def show
		@user = current_user
	end

	private
	    def make_sure_its_mine
      		unless current_user.id==params[:id].to_i
        		redirect_to root_url, alert: "To nie twoje konto!"
      		end
      		true
      	end
	end

