class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]
  def index
    @likes = Like.all
  end

  def create
    @user = current_user
    @tweet = Tweet.find(params[:id])
    @like = Like.new(like_params.merge(user_id: @user.id, tweet_id: @tweet.id))
    respond_to do |format|
      if @like.save
        format.html { redirect_to root_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path 
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params.fetch(:like, {}).permit(:user_id, :tweet_id)
    end

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
