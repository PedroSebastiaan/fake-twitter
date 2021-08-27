class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]

    def show
        @user = current_user
        @tweets = Tweet.where(user_id: @user.id).order(id: :desc)
        @tweets = @tweets.page(params[:page])
    end

    def find_people
        if params[:q]
            @users = User.where('lower(name) LIKE ?', "%#{params[:q]}%").order(id: :desc)
            @users = @users.page(params[:page])
        else
            @users = User.all
            @users = @users.page(params[:page])
        end
    end

    def modify
        @user = User.find(params[:id])

        if @user.suspended? 
            @user.update(suspended: false)
        else
            @user.update(suspended: true)
        end

        respond_to do |format|
            format.html { redirect_to admin_users_path, notice: 'Status changed' }
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end