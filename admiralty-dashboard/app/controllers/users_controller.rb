class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
    
    def new
        @user = User.new 
    end

    def create 
        @user = User.create(user_params)
        session[:user_id] = @user.id
        if @user.save 
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def show
        @user = current_user
        @captains = @user.captains
        @ships = @user.ships
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
