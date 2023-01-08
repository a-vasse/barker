class PagesController < ApplicationController
  skip_before_action :authenticate_user! , only: [:home]

  def index
    @bark = Bark.new
    @user = current_user
    if current_user.nil?
      @barks = Bark.all.order("created_at DESC")
    else
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
  end
end
