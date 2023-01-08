class BarksController < ApplicationController
  def index
    @bark = Bark.new
    @user = current_user
    @barks = []
    current_user.barks.each do |bark|
      @barks << bark
    end
    current_user.followees.each do |follower|
      follower.barks.each do |bark|
        @barks << bark
      end
    end
    @barks = @barks.sort_by { |bark| bark.created_at}.reverse!
  end

  def create
    if Following.find_by(followed_id: 1, follower_id: 1).nil?
      Following.create(followed_id: current_user.id, follower_id: current_user.id)
    end
    @user = User.find(current_user.id)
    @bark = Bark.new(bark_params)
    @bark.user = @user
    if @bark.save
      redirect_to barks_path
    end
  end

  private

  def bark_params
    params.require(:bark).permit(:message)
  end
end
