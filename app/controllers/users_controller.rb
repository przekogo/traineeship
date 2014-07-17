class UsersController < ApplicationController
  	before_action :authenticate_user!
	def index
		@users = User.all
	end

	def show
		@user = current_user
	end

	def new
		@user=User.new
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path, notice: 'Usunieto'
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path, notice: 'Dodano'
		else
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password)
		end

	    def make_sure_its_mine
      		unless current_user.id==params[:id].to_i
        		redirect_to root_url, alert: "To nie twoje konto!"
      		end
      		true
      	end
	end

