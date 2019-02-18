class UsersController < ApplicationController
    before_action :require_login
    
    def new
        @user = User.new 
    end

    def create 
        @user = User.create(user_params)
        if @user.save 
            redirect_to user_path(@user.id)
        else 
            render :new
        end
    end

    def show
        @captains =  
    end

    private

    def user_params
        params.require(:user).permit(:name, :age, :nationality, :password, :password_confirmation)
    end

    def require_login 
        return head(:forbidden) unless session.include? :name
    end
end
