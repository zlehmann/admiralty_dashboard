class UsersController < ApplicationController
    def new
        @user = User.new 
    end

    def create 
        binding.pry
        @user = User.create(user_params)
        if @user.save 
            redirect_to user_path(@user.id)
        else 
            render :new
        end
    end

    def show
        if params[:captain_id]
            @captains
        end 
    end

    private

    def user_params
        params.require(:user).permit(:name, :age, :nationality, :password, :password_confirmation)
    end
end
