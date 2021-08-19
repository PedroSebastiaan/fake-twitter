class HomeController < ApplicationController
  def index
    @tweets = Tweet.order(id: :desc)
    @tweets = @tweets.page(params[:page])
    @newtweet = Tweet.new
    @users = User.all
  end

  # POST /tweets or /tweets.json
  def create
    @newtweet = Tweet.new(tweet_params.merge(user_id: current_user.id))
    @newtweet.date = DateTime.now

    respond_to do |format|
      if @newtweet.save
        format.html { redirect_to root_path, notice: "Tweet was successfully created!" }
      else
        format.html { redirect_to root_path, notice: "We have some problems."  }
        format.json { render json: @newtweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
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

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
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
