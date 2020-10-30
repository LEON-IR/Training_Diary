class Users::MenusController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update, :destroy]

    def show
		@menu = Menu.find(params[:id])
		@user = @book.user
		@menus = Menu.all
		@menu_new = menu.new
		@menu_comments = @menu.menu_comments
		@menu_comment = MenuComment.new
	end

	def create
		@menu = Menu.new(menu_params)
		@menu.user_id = current_user.id
		if@menu.save
			flash[:success] = "メニューの登録に成功しました"
			redirect_to menu_path(@menu.id)
		else
			@menus = Menu.all
			render 'index'
		end
	end

	def index
		@menus = Menu.all
		@menu = Menu.new
	end

	def edit
		@menu = Menu.find(params[:id])
		@menu_edit = Menu.new
	end

	def update
		@menu = Menu.find(params[:id])
		if@menu.update(menu_params)
		   flash[:success] = "メニューの更新に成功しました"
           redirect_to menu_path(@menu)
        else
        	edit_menu_path(@menu)
        	render 'edit'
        end
	end

	def destroy
		menu = Menu.find(params[:id])
		menu.destroy
		redirect_to menus_path
	end

	def userinfo
		@menu = Menu.new
	end

	private
	def menu_params
		params.require(:menu).permit(:title, :body, :image, :user_id)
	end

	def correct_user
		@menu = Menu.find(params[:id])
		if current_user.id != @menu.user_id
           redirect_to menus_path
       end
    end

end
