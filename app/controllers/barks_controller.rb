class BarksController < ApplicationController
  def create
    if Following.find_by(followed_id: 1, follower_id: 1).nil?
      Following.create(followeed_id: current_user.id, follower_id: current_user.id)
    end
    @user = User.find(current_user.id)
    @bark = Bark.new(bark_params)
    @bark.user = @user
    if @bark.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
private
def bark_params
    params.require(:bark).permit(:message)
  end
end
