class SessionsController < ApplicationController
    def new
        render :new 
    end

    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end
        
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

    private

    def auth
        request.env['omniauth.auth']
    end
end