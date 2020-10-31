class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@users = User.all.page(params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admins_user_path(@user)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :tel, :is_deleted)
	end

end
