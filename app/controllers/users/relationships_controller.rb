class Users::RelationshipsController < ApplicationController

  def create
  	follows = current_user.active_relationships.build(follower_id: params[:user_id])
    follows.save
    redirect_to request.referer
  end

  def destroy
  	follows = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follows.destroy
    redirect_to request.referer
  end

  def follows
      @user = User.find(params[:user_id])
      @users = @user.followings
  end

  def followers
      user = User.find(params[:user_id])
      @users = user.followers
  end


end
