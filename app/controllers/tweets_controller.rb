class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  def show
  end

  def retweet
    @users = User.all
    @tweet = Tweet.find(params[:id])
    @retweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @tweet.save
        if @tweet.retweet_id != nil
          @retweeted = Tweet.find(@tweet.retweet_id)
          @retweeted.increment!(:retweet_count)
          format.html { redirect_to root_path, notice: "Tweet was successfully created!" }
        else
          format.html { redirect_to root_path, notice: "Tweet was successfully created!" }
        end
      else
        format.html { redirect_to root_path, notice: "We have some problems."  }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
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
