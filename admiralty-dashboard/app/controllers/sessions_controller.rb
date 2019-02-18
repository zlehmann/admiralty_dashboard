class SessionsController < ApplicationController
    def new
        render :new 
    end

    def create
        @user = User.find_by(name: params[:session][:name])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            @error = "Incorrect user/password combination."
            render :new
        end
    end

    def destroy
        session.delete :user_id 
        redirect_to login_path
    end

    def forbidden
        render :forbidden 
    end
end