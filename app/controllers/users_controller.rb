class UsersController < ApplicationController
  def show
    @admin = User.find(1)
    @users = User.all
    @user = User.friendly.find(params[:id])
    @barks = User.friendly.find(params[:id]).barks.order("created_at DESC")

    @followees = []
    current_user.followees.each do |followee|
      if followee != current_user
        @followees << followee
      end
    end
    @followees = @followees.sort_by(&:name)

    @followers = []
    current_user.followers.each do |follower|
      if follower != current_user
        @followers << follower
      end
    end
    @followers = @followers.sort_by(&:name)
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
