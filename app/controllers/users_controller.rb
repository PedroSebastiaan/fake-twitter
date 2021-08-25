class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]

    def show
        @user = current_user
        @tweets = Tweet.where(user_id: @user.id).order(id: :desc)
        @tweets = @tweets.page(params[:page])
    end

    def find_people
        @users = User.all
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end