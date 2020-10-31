class Users::FavoritesController < ApplicationController

	before_action :authenticate_user!

	def create
		menu = Menu.find(params[:menu_id])
		favorite = current_user.favorites.new(menu_id: menu.id)
		favorite.save
		redirect_to menus_path
	end

	def destroy
		menu = Menu.find(params[:menu_id])
		favorite = current_user.favorites.find_by(menu_id: menu.id)
		favorite.destroy
		redirect_to menus_path
	end

end
