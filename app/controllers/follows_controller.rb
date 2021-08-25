class FollowsController < ApplicationController
    before_action :set_user, only: %i[ destroy ]

    def create
        @tweet = Tweet.find(params[:id])
        @added = @tweet.user_id
        @user = current_user
        @follow = Follow.new(follow_params.merge(user_id: @user.id, follow_id: @added))
        respond_to do |format|
            if @follow.save
            format.html { redirect_to root_path }
            else
            format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @follow = Follow.find(params[:id])
        @follow.destroy
        redirect_to root_path 
    end

    private
    def set_follow
        @follow = Follow.find(params[:id])
    end

    def follow_params
        params.fetch(:follow, {}).permit(:user_id, :follow_id)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end