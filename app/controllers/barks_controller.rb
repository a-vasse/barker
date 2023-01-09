class BarksController < ApplicationController
  def index
    @admin = User.find(1)
    @users = User.all
    @bark = Bark.new
    @user = current_user

    @barks = []
    current_user.followees.each do |follower|
      follower.barks.each do |bark|
        @barks << bark
      end
    end
    @barks = @barks.sort_by(&:created_at).reverse!

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

  def create
    if Following.find_by(followed_id: current_user.id, follower_id: current_user.id).nil?
      Following.create(followed_id: current_user.id, follower_id: current_user.id)
    end
    @user = User.find(current_user.id)
    @bark = Bark.new(bark_params)
    @bark.user = @user
    if @bark.save
      redirect_to barks_path
    end
  end

  def destroy
    @bark = Bark.find(params[:id])
    @bark.destroy
    redirect_to barks_path
  end

  private

  def bark_params
    params.require(:bark).permit(:message)
  end
end
