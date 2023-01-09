class UsersController < ApplicationController

  def show
    @users = User.all
    @user = User.friendly.find(params[:id])
    @barks = User.friendly.find(params[:id]).barks.order("created_at DESC")
  end
end
