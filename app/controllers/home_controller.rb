class HomeController < ApplicationController
  def index
    @tweets = Tweet.order(id: :desc)
    @tweets = @tweets.page(params[:page])
    @newtweet = Tweet.new
    @users = User.all
    @newlike = Like.new
    @likes = Like.all
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
