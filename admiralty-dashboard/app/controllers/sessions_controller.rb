class SessionsController < ApplicationController
    def new
        render :new 
    end

    def create
        if auth_hash
            @user = User.find_by(email: auth_hash['info']['email'])
            if @user.nil?
                @user = User.create({ :email => auth_hash['info']['email']})
                @user.name = auth_hash['info']['name']
                @user.provider = auth_hash['info']['provider']
                @user.password = "super encrypted password"
                @user.save
            end
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            @user = User.find_by(email: params[:session][:email])
            if @user && @user.authenticate(params[:session][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user.id)
            else
                @error = "Incorrect email/password combination."
                render :new
            end
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

    def auth_hash
        request.env['omniauth.auth']
    end
end