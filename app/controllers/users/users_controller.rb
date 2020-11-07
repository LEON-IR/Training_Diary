class Users::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def index
		@users = User.all.page(params[:page]).reverse_order
		@user = current_user
		@menu = Menu.new
	end

	def show
		@user = User.find(params[:id])
		@menus = @user.menus
		@menu = Menu.new
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(current_user.id)
		if @user.update(user_params)
			redirect_to users_path(@user)
			flash[:success] = "ユーザーのアップデートに成功しました"
		else
			render :edit
		end
	end

	def userinfo
		@user = User.find(current_user.id)
	end

	def unsubscribe
		@user = User.find(current_user.id)
		@user.destroy
		redirect_to root_path
	end

	def withdraw
		@user = current_user
		@user.update(is_deleted: true)

		reset_session
		redirect_to root_path
	end

	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :tel, :introduction)
	end

	def correct_user
	    @user = User.find(params[:user_id])
	    if current_user.id != @user.id
	        redirect_to user_path(current_user.id)
	    end
	end

end
