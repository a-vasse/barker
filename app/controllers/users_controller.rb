class UsersController < ApplicationController
  def show
    @admin = User.find(1)
    @users = User.all
    @user = User.friendly.find(params[:id])
    @barks = User.friendly.find(params[:id]).barks.order("created_at DESC")
  end

  def follow
    @follow_user = User.friendly.find(params[:id])
    current_user.follow(@follow_user)
    redirect_to user_path(@follow_user)
  end

  def unfollow
    @unfollow_user = User.friendly.find(params[:id])
    current_user.unfollow(@unfollow_user)
    redirect_to user_path(@unfollow_user)
  end
end
