class Admins::MenusController < ApplicationController
	before_action :authenticate_admin!

	def index
		@menus = Menu.joins(:genre).whrere(genre: { is_active: "有効" }).
		  page(params[:page])
	end

	def create
		@menu = Menu.new(menu_params)
		if @user.save
			redirect_to admins_menu_path(@menu)
		else
			render :new
		end
	end

	def new
		@menu = Menu.new
	end

	def show
		@menu = Menu.find(params[:id])
	end

	def edit
		@menu = Menu.find(params[:id])
	end

	def update
		@menu = Menu.find(params[:id])
		if @menu.update(menu_params)
			redirect_to admins_menus_path(@menu)
		else
			render :edit
		end
	end

	def menu_params
		params.require(:menu).permit(:menu_id, :name, :explanation, :image, :is_active)
	end
end
