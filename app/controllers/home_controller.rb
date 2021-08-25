class HomeController < ApplicationController
  def index
    if current_user
      @my_follows = Follow.where(user_id: current_user.id).pluck(:follow_id)
      @tweets = Tweet.where(:user_id => @my_follows).order(id: :desc)
      @tweets = @tweets.page(params[:page])
      @newtweet = Tweet.new
      @likes = Like.all
      @newlike = Like.new
    else
      @tweets = Tweet.order(id: :desc)
      @tweets = @tweets.page(params[:page])
    end    
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:content, :retweet_id, :date)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
