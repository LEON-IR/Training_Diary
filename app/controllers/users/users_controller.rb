class Users::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def index
		@users = User.all
		@user = current_user
		@menu = Menu.new
	end

	def show
		@user = current_user
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
	end

	def withdraw
		@user = current_user
		@user.update(is_deleted: true)

		reset_session
		redirect_to root_path
	end

	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :prefecture_code, :address_city, :address_street, :tel)
	end

	def correct_user
	    @user = User.find(params[:id])
	    if current_user.id != @user.id
	        redirect_to user_path(current_user.id)
	    end
	end

	def follows
	    user = User.find(params[:id])
	    @users = user.followings
	end

	def followers
	    user = User.find(params[:id])
	    @users = user.followers
	end


end
